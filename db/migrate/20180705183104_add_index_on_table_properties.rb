class AddIndexOnTableProperties < ActiveRecord::Migration[5.2]
  def change
      add_index :properties, :ad_type
      add_index :properties, :property_type
      add_index :properties, :city
      add_index :properties, :price
      add_index :properties, :area
  end
end
