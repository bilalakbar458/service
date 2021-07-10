class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.date :due_date
      t.string :task_type

      t.timestamps
    end
  end
end
