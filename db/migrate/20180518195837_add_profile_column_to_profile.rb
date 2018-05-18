class AddProfileColumnToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :phone_number, :integer, limit: 8
    add_column :profiles, :address, :string
    add_column :profiles, :about_me, :text
  end
end
