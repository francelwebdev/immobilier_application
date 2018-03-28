class AddRoomToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :room, :string
  end
end
