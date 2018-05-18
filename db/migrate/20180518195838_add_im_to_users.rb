class AddImToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :im, :string
  end
end
