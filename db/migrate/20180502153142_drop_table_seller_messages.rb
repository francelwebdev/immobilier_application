class DropTableSellerMessages < ActiveRecord::Migration[5.2]
  def change
  	drop_table :seller_messages
  end
end
