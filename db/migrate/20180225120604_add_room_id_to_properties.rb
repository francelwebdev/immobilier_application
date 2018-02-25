class AddRoomIdToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :room_id, :integer
    add_index :properties, :room_id
  end
end
