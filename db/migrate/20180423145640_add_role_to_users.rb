class AddRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string
    add_index :users, :role, unique: true
  end
end
