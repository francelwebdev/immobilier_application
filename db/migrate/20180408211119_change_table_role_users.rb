class ChangeTableRoleUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :user_roles do |t|
        t.rename :role, :name
    end
  end
end
