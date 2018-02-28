class AddPropertyIdToPropertyPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :property_photos, :property_id, :integer
    add_index :property_photos, :property_id
  end
end
