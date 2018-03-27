class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.string :address
      t.string :description
      t.string :picture

      t.timestamps
    end
  end
end
