class RemoveUserGroupIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_group_id, :integer
  end
end
