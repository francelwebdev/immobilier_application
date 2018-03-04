class AddSlugToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :slug, :string
    add_index :properties, :slug, unique: true
  end
end
