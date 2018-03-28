class RemoveAdTypeIdFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :ad_type_id, :bigint
  end
end
