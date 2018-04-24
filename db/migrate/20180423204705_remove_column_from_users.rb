class RemoveColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address, :string
    remove_column :users, :about_me, :string
    remove_column :users, :experience, :string
  end
end
