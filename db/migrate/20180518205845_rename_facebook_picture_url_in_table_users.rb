class RenameFacebookPictureUrlInTableUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :facebook_picture_url, :image
  end
end
