class AddAvanceToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :avance, :integer
  end
end
