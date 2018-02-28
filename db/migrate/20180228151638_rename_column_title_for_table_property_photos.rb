class RenameColumnTitleForTablePropertyPhotos < ActiveRecord::Migration[5.1]
  def change
  	rename_column :property_photos, :title, :name
  end
end
