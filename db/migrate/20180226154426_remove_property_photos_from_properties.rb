class RemovePropertyPhotosFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :property_photos, :json
  end
end
