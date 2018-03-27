class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :company_id
      t.string :picture

      t.timestamps
    end
  end
end
