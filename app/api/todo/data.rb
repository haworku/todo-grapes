module Todo
  class Data < Grape::API

    resource :task_data do
      desc "List all Task"

      get do
        Task.all
      end

    end

  end
end