class RemoveAboutMeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :about_me, :text
  end
end
