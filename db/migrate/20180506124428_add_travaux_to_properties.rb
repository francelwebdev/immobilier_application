class AddTravauxToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :travaux, :string
  end
end
