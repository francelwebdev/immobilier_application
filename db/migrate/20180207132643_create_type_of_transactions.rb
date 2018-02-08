class CreateTypeOfTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :type_of_transactions do |t|
      t.string :name

      t.timestamps
    end
  end
end
