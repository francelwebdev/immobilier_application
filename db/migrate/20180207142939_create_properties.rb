class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :slug
    end
    add_index :properties, :slug, unique: true
  end
end
