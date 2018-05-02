class AddUserRefToSellerMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :seller_messages, :user, foreign_key: true
  end
end
