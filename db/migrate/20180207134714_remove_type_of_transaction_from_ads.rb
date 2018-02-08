class RemoveTypeOfTransactionFromAds < ActiveRecord::Migration[5.1]
  def change
    remove_column :ads, :type_of_transaction, :integer
  end
end
