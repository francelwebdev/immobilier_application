class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :logo
      t.string :address
      t.integer :phone_number, limit: 8
      t.string :email
      t.string :website
      t.text :about_agency

      t.timestamps
    end
    add_index :agencies, :phone_number, unique: true
    add_index :agencies, :email, unique: true
    add_index :agencies, :website, unique: true
  end
end
