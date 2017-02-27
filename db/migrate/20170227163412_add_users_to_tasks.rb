class AddUsersToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :users, index: true, foreign_key: true
  end
end
