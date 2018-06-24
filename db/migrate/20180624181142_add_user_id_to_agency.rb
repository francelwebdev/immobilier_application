class AddUserIdToAgency < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :user_id, :integer
  end
end
