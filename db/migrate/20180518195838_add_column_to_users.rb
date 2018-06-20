class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :role, :string
    add_column :users, :name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile_picture, :string
    add_column :users, :phone_number, :integer, uniq: true
    add_column :users, :terms_and_conditions, :boolean, default: true
  end
end
