class RemoveFacebookPictureUrlFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :facebook_picture_url, :string
  end
end
