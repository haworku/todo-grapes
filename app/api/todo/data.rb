module Todo
  class Data < Grape::API

    resource :tasks do

    # GET ALL TASKS 
      desc 'List All Tasks'
	      get do
	        Task.all.order(:due_date)
	      end

	  # POST TASK
      desc 'Create Task'
				params do
				  requires :name, type: String
				  optional :users_id, type:Integer
				  optional :due_date, type: String
				  optional :complete, type: String
				end
		
				post do
				  Task.create!(
				 		declared(params, include_parent_namespaces: false, include_missing: false).to_h
				 	)
				end
	  
	  # < NESTED UNDER: 'USERS/ :USER_ID'>
	  	resource :users do 
		    route_param :user_id do

		# GET ALL TASKS FROM SINGLE USER
	    		desc 'List Tasks From User'	
			      get '/' do  # => '.../users/:user_id
			        Task.where({users_id: params[:user_id].to_i})
			      end

		# GET INCOMPELTE TASKS FROM USER
		      desc 'List Incomplete Tasks From User'
		      resource :incomplete do  
	          get '/' do  # => '.../users/:user_id/incomplete'
	            Task.where({users_id: params[:user_id].to_i, complete: false})
	          end
		      end
	      end
      end

    # < NESTED: :TASK_ID/>  
	    route_param :task_id, requirements: { task_id: /[0-9]*/ } do

	  # GET SINGLE TASK
	    	desc 'List single task'
		      get do
		        Task.find(params[:task_id].to_i)
		      end

		# UPDATE TASK
				desc 'Update Task'
					params do
					  optional :name, type: String
					  optional :users_id, type:Integer
					  optional :due_date, type: String
					  optional :complete, type: String
					end
					
					put do
					  found = Task.find(params[:task_id])
					  if found 
					  	found.update!(
						    declared(params, include_parent_namespaces: false, include_missing: false).to_h
						  )
						else
							error! 
						end
					end

		# DELETE TASK
				desc 'Delete Task'
					delete do
					 	found = Task.find(params[:task_id])
					 	if found
					   	found.destroy!
					   	status 200
					  else
					  	error!
					  end
				 end
		  end

		404
			route :any, '*path' do
			  error! 
			end
    end
  end
end