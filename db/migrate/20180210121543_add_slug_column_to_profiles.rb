class AddSlugColumnToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :slug, :string
    add_index :profiles, :slug, unique: true
  end
end
