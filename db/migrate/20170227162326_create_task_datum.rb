class CreateTaskDatum < ActiveRecord::Migration[5.0]
  def change
    create_table :task_datum do |t|
      t.string :name
      t.boolean :complete

      t.timestamps
    end
  end
end
