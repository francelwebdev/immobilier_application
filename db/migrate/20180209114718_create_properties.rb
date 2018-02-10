class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.references :type_of_property, foreign_key: true
      t.decimal :price, precision: 8, scale: 2
      t.integer :area, limit: 4
      t.string :image1_url
      t.string :image2_url
      t.string :image3_url
      t.text :description
      t.string :address
      t.string :city
      t.references :type_of_transaction, foreign_key: true

      t.timestamps
    end
  end
end
