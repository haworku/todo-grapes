module Todo
  class Data < Grape::API

    resource :task_data do
      desc "List all Task"

      get do
        TaskData.all
        puts "in this"
      end

    end

  end
end