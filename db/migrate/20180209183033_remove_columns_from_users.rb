class RemoveColumnsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :address, :string
    remove_column :users, :city, :string
    remove_column :users, :phone_number, :integer
    remove_column :users, :last_name, :string
    remove_column :users, :first_name, :string
  end
end
