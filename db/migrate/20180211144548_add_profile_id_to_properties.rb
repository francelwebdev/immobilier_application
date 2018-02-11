class AddProfileIdToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :profile_id, :integer
    add_index :properties, :profile_id
  end
end
