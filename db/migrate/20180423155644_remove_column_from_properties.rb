class RemoveColumnFromProperties < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :photo1, :string
    remove_column :properties, :photo2, :string
    remove_column :properties, :photo3, :string
  end
end
