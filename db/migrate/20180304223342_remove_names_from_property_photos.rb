class RemoveNamesFromPropertyPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :property_photos, :names, :json
  end
end
