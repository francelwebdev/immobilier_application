class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :ad_types, :name, :title
    rename_column :property_types, :name, :title
  end
end
