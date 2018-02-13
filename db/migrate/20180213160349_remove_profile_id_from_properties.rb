class RemoveProfileIdFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :profile_id, :integer
  end
end
