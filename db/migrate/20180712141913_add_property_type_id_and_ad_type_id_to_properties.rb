class AddPropertyTypeIdAndAdTypeIdToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :property_type_id, :integer
    add_column :properties, :ad_type_id, :integer
  end
end
