class DropTablePropertyPhotos < ActiveRecord::Migration[5.2]
  def change
      drop_table :property_photos
  end
end
