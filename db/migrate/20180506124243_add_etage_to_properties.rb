class AddEtageToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :etage, :string
  end
end
