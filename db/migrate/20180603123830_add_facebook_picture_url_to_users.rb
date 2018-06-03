class AddFacebookPictureUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook_picture_url, :string
  end
end
