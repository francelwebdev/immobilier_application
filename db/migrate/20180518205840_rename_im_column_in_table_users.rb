class RenameImColumnInTableUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :im, :role
  end
end
