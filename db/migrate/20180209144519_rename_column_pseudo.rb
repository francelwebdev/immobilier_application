class RenameColumnPseudo < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :pseudo, :username
  end
end
