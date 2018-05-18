class AddFieldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :about_me, :text
    add_column :users, :address, :string
  end
end
