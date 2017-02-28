module Todo
  class Data < Grape::API

    resource :task_data do

    	# GET
    	# SORT BY DUE DATE???
      desc 'List All Tasks'
	      get do
	        Task.all
	      end

	    # GET
      desc 'List All Tasks'
	      get do
	        Task.all
	      end

	    # POST
      desc 'Create Task'
				params do
				  requires :name, type: String
				  requires :users_id, type:Integer
				  optional :due_date, type: String
				  optional :complete, type: String
				  exactly_one_of :name, :due_date
				end
		
				post do
				  Task.create!({
				    name:params[:name],
				    users_id:params[:user_id],
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
			
				put ':id' , requirements: { id: /[0-9]*/ } do
				  found = Task.find(params[:id])
				  if found
				  	found.update({
					    name:params[:name],
					    due_date:params[:due_date],
					    users_id:params[:user_id],
					    complete:params[:complete]
					  })
					else
						error! 
						puts found.errors
					end
				end

			# DELETE
			desc 'Delete Task'
			 params do
			   requires :id, type: Integer
			 end
			 delete ':id' , requirements: { id: /[0-9]*/ } do
			   Task.find(params[:id]).destroy!
			   puts 'successfully deleted'
			   success API::Entities::Entity
			 end

			# 404
			route :any, '*path' do
			  error! 
			end
    end


  end
end