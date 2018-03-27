class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :status_id
      t.integer :project_id
      t.integer :category_id
      t.integer :open_user_id
      t.integer :user_id
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :conclusion_at
      t.datetime :finish_at
      t.integer :effort_min
      t.integer :worked_min
      t.integer :priority

      t.timestamps
    end
  end
end
