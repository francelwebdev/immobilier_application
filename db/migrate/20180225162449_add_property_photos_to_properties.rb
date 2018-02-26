class AddPropertyPhotosToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :property_photos, :json
  end
end
