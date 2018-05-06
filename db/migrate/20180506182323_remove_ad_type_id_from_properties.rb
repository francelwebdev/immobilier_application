class RemoveAdTypeIdFromProperties < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :ad_type_id, :integer
  end
end
