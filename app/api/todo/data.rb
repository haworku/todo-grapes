module Todo
  class Data < Grape::API

    resource :tasks do

    	# GET ALL TASKS SORTED BY DUE DATE
      desc 'List All Tasks'
	      get do
	        Task.all.order(:due_date)
	      end

	    # GET ALL TASKS FROM USER
    	desc 'List Tasks From User'	
    	resource :users do
		    route_param :user_id do
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

	    # POST
	    # BUG: if complete field is not included pass nothing rather than null
	    # BUG: if due date is incorrectly formatted send back error than than just making null
      desc 'Create Task'
				params do
				  requires :name, type: String
				  requires :users_id, type:Integer
				  optional :due_date, type: String
				  optional :complete, type: String
				end
		
				post do
				  Task.create!({
				    name:params[:name],
				    users_id:params[:users_id],
				    due_date:params[:due_date],
				    complete:params[:complete]
				    
				  })
				end

			# PUT/PATCH
			desc 'Update Task'
				params do
				  requires :id, type: Integer
				  optional :name, type: String
				  optional :users_id, type:Integer
				  optional :due_date, type: String
				  optional :complete, type: String
				end
			
				put ':task_id' , requirements: { task_id: /[0-9]*/ } do
				  found = Task.find(params[:task_id])
				  if found
				  	found.update({
					    name:params[:name],
					    due_date:params[:due_date],
					    users_id:params[:users_id],
					    complete:params[:complete]
					  })
					else
						error! 
						puts found.errors
					end
				end

			# DELETE
			desc 'Delete Task'
			 delete ':task_id' , requirements: { task_id: /[0-9]*/ } do
			   Task.find(params[:task_id]).destroy!
			   puts 'successfully deleted'
			 end

			# 404
			route :any, '*path' do
			  error! 
			end
    end


  end
end