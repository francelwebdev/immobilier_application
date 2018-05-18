class RenameColumnEmailAddressInTableNewsletters < ActiveRecord::Migration[5.2]
  def change
  	rename_column :newsletters, :email_address, :email
  end
end
