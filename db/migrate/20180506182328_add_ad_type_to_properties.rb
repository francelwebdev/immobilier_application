class AddAdTypeToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :ad_type, :string
  end
end
