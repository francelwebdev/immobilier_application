class RenameTablePropertyFeature < ActiveRecord::Migration[5.2]
  def change
  	rename_column :properties, :property_feature, :feature
  end
end
