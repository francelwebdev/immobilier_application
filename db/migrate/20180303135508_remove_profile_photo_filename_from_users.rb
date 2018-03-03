class RemoveProfilePhotoFilenameFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :profile_photo_filename, :string
  end
end
