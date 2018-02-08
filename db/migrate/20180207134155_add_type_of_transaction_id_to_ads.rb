class AddTypeOfTransactionIdToAds < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :type_of_transaction_id, :integer
    add_index :ads, :type_of_transaction_id
  end
end
