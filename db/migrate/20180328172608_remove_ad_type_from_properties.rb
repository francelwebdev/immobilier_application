class RemoveAdTypeFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :ad_type, :string
  end
end
