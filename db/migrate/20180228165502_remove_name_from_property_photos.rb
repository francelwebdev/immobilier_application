class RemoveNameFromPropertyPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :property_photos, :name, :string
  end
end
