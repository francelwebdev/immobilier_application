class RemovePhoto3FromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :photo3, :string
  end
end
