class DropTableRemoveColumnFromProperties < ActiveRecord::Migration[5.2]
  def change
    drop_table :remove_column_from_properties
  end
end
