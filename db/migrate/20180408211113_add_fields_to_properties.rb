class AddFieldsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :bedroom, :string
    add_column :properties, :bathroom, :string
  end
end
