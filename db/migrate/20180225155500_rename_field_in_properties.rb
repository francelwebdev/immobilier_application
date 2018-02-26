class RenameFieldInProperties < ActiveRecord::Migration[5.1]
  def change
    rename_column :properties, :image1, :photo1
    rename_column :properties, :image2, :photo2
    rename_column :properties, :image3, :photo3
  end
end
