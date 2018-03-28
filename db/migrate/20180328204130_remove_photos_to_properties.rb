class RemovePhotosToProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :photos, :json
  end
end
