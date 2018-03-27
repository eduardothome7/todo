class CreateActivityTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_tasks do |t|
      t.integer :task_id
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
