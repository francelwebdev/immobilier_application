class AddAvailableToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :available, :boolean
  end
end
