class ChangeColumnPrice < ActiveRecord::Migration[5.1]
  def change
    change_column :properties, :price, :decimal, precision: 10, scale: 2
  end
end
