class ChangeColumnPriceInTableProperties < ActiveRecord::Migration[5.2]
  def change
  	change_column :properties, :price, :decimal
  end
end
