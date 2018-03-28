class RemovePropertyTypeIdFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :property_type_id, :bigint
  end
end
