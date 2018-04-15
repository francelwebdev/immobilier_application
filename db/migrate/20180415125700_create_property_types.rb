class CreatePropertyTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :property_types do |t|
      t.string :name
    end
  end
end
