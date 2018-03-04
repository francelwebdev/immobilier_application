class AddPhotoToPropertyPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :property_photos, :photo, :string
  end
end
