class AddCustomField1ToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pseudo, :string
    add_index :users, :pseudo, unique: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :integer, limit: 8
    add_column :users, :address, :string
    add_column :users, :city, :string
  end
end
