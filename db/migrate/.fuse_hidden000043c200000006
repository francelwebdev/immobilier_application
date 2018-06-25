class AddUserIdToAgency < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :user_id, :integer
    add_index :agencies, :user_id
  end
end
