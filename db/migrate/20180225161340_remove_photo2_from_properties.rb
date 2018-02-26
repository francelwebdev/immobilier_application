class RemovePhoto2FromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :photo2, :string
  end
end
