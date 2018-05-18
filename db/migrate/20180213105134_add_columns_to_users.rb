class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :integer, limit: 8
    add_index :users, :phone_number, unique: true
    add_column :users, :profile_photo, :string
  end
end
