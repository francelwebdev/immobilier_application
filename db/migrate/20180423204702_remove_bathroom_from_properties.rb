class RemoveBathroomFromProperties < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :bathroom, :string
  end
end
