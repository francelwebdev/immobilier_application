class RenameColumnNames < ActiveRecord::Migration[5.1]
  def change
  	change_column :property_photos, :names, :string
  end
end
