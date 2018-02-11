class DropTableProperties < ActiveRecord::Migration[5.1]
  def change
    drop_table :properties
  end
end
