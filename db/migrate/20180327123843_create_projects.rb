class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.integer :client_id
      t.string :name
      t.text :description
      t.integer :status_project

      t.timestamps
    end
  end
end
