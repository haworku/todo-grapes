class AddUsersToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :users, index: true, foreign_key: true
  end
end
