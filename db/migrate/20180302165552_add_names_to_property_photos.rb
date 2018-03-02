class AddNamesToPropertyPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :property_photos, :names, :json
  end
end
