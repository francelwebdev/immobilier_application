class AddRoomRefToProperties < ActiveRecord::Migration[5.1]
  def change
    add_reference :properties, :room, foreign_key: true
  end
end
