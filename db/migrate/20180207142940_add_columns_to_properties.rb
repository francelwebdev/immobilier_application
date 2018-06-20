class AddColumnsToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :title, :string
    add_column :properties, :price, :decimal
    add_column :properties, :area, :integer
    add_column :properties, :description, :text
    add_column :properties, :address, :string
    add_column :properties, :city, :string
    add_column :properties, :room, :string
    add_column :properties, :available, :boolean
    add_column :properties, :published, :boolean, default: true
    add_column :properties, :deposit, :integer
    add_column :properties, :feature, :string, array: true
    add_column :properties, :etage, :string
    add_column :properties, :published_at, :datetime
    add_column :properties, :property_type, :string
    add_column :properties, :ad_type, :string
    add_column :properties, :expire_at, :datetime
  end
end
