class AddCityIdToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :city_id, :integer
  end
end
