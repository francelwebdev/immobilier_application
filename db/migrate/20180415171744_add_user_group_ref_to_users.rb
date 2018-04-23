class AddUserGroupRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :user_group, foreign_key: true
  end
end
