class AddProfilePhotoContentTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_photo_content_type, :string
  end
end
