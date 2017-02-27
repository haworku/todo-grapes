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
				  requires :user_id, type:Integer
				end
		
				post do
				  Task.create!({
				    name:params[:name],
				    due_date:params[:due_date],
				    user_id:params[:user_id]
				  })
				end

			# PUT/PATCH
			desc "Update Task"
				params do
				  requires :id, type: String
				end
			
				put ':id' do
				  found = Task.find(params[:id])
				  if found
				  	found.update({
					    name:params[:name],
					    due_date:params[:due_date],
					    user_id:params[:user_id]
					  })
					else
						error! 
						puts found.errors
					end
				end

			# DELETE
			desc "Delete Task"
			 params do
			   requires :id, type: String
			 end
			 delete ':id' do
			   Task.find(params[:id]).destroy!
			 end

    end


  end
end