class RemoveCityAndAdTypeAndPropertyTypeFromProperties < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :city, :string
    remove_column :properties, :ad_type, :string
    remove_column :properties, :property_type, :string
  end
end
