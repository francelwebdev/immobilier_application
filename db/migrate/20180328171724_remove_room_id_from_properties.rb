class RemoveRoomIdFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :room_id, :bigint
  end
end
