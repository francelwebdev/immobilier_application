class RemoveNameAndGenderFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :string
    remove_column :users, :gender, :string
  end
end
