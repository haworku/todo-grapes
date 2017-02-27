module Todo
  class Data < Grape::API

    resource :task_data do

    	# GET
      desc "List All Tasks"
	      get do
	        Task.all
	      end

	    # POST
      desc "Create Task"
				params do
				  requires :name, type: String
				  requires :due_date, type: String
				  requires :users_id, type:Integer
				end
		
				post do
				  Task.create!({
				    name:params[:name],
				    due_date:params[:due_date],
				    users_id:params[:user_id]
				  })
				end

			# PUT/PATCH
			desc "Update Task"
				params do
				  requires :id, type: Integer
				end
			
				put do
				  found = Task.find(params[:id])
				  if found
				  	found.update({
					    name:params[:name],
					    due_date:params[:due_date],
					    users_id:params[:user_id]
					  })
					else
						error! 
						puts found.errors
					end
				end

			# DELETE
			desc "Delete Task"
			put 'HELLOO'
			 params do
			   requires :id, type: Integer
			 end
			 delete do
			   Task.find(params[:id]).destroy!
			 end

    end


  end
end