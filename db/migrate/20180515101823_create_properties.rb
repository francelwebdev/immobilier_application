class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :title
      t.decimal :price
      t.integer :area
      t.text :description
      t.string :address
      t.string :city
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.string :slug
      t.string :room
      t.boolean :available
      t.boolean :published
      t.integer :avance
      t.string :feature
      t.string :etage
      t.string :travaux
      t.datetime :published_at
      t.string :commune
      t.string :property_type
      t.string :ad_type
      t.datetime :expiration_date
      t.references :user, foreign_key: true
    end
    add_index :properties, :slug, unique: true
  end
end
