class RemovePropertyTypeIdFromProperties < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :property_type_id, :integer
  end
end
