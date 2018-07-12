class AddRoomIdToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :room_id, :integer
  end
end
