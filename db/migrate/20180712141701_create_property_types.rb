class CreatePropertyTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :property_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :property_types, :name, unique: true
  end
end
