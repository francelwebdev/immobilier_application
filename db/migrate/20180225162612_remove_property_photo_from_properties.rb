class RemovePropertyPhotoFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :property_photo, :json
  end
end
