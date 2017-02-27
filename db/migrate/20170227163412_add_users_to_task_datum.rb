class AddUsersToTaskDatum < ActiveRecord::Migration[5.0]
  def change
    add_reference :task_datum, :users, index: true, foreign_key: true
  end
end
