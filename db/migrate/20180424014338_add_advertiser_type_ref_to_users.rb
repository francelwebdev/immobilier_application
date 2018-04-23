class AddAdvertiserTypeRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :advertiser_type, foreign_key: true
  end
end
