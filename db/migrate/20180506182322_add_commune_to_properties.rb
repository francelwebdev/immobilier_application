class AddCommuneToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :commune, :string
  end
end
