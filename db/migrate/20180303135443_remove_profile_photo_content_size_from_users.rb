class RemoveProfilePhotoContentSizeFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :profile_photo_content_size, :string
  end
end
