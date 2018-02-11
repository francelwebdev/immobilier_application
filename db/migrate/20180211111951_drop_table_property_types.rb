class DropTablePropertyTypes < ActiveRecord::Migration[5.1]
  def change
    drop_table :property_types
  end
end
