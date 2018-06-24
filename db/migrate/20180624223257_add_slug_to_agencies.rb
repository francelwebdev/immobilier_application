class AddSlugToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :slug, :string
    add_index :agencies, :slug, unique: true
  end
end
