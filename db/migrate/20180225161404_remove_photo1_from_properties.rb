class RemovePhoto1FromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :photo1, :string
  end
end
