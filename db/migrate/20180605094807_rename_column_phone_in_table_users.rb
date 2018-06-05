class RenameColumnPhoneInTableUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :phone, :phone_number
  end
end
