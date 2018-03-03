class RenameColumnProfilePhotoIdInUsers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :profile_photo_id, :profile_photo
  end
end
