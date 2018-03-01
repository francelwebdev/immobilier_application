class RenameColumnNames1 < ActiveRecord::Migration[5.1]
  def change
  	rename_column :property_photos, :names, :name
  end
end
