class AddPhotosToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :photos, :json
  end
end
