class RenameColumnInTableMessages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :messages, :buyer_message, :customer_message
  	rename_column :messages, :buyer_email, :customer_email
  	rename_column :messages, :buyer_phone_number, :customer_phone_number
  	rename_column :messages, :buyer_full_name, :customer_full_name
  end
end
