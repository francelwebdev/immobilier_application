class RemoveBedroomFromProperties < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :bedroom, :string
  end
end
