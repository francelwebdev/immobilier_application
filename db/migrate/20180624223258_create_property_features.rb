class CreatePropertyFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :property_features do |t|
      t.references :property, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
