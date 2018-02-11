class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.references :property_type, foreign_key: true
      t.references :ad_type, foreign_key: true
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.integer :area, limit: 4
      t.text :description
      t.string :address
      t.string :city
      t.string :image1
      t.string :image2
      t.string :image3
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
