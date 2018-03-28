class RenameColumns < ActiveRecord::Migration[5.1]
  def change
      rename_column :ad_types, :title, :name
      rename_column :property_types, :title, :name
  end
end
