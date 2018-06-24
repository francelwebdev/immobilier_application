class AddAgencyIdToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :agency_id, :integer
    add_index :properties, :agency_id
  end
end
