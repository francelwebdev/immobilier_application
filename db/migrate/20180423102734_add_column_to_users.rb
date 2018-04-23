class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :integer, limit: 8
    add_column :users, :profile_photo, :string
    add_column :users, :address, :string
  end
end
