class AddPropertyPhotoToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :property_photo, :json
  end
end
