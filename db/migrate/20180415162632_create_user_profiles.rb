class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number, limit: 8
      t.string :profile_photo
      t.string :address

      t.timestamps
    end
    add_index :user_profiles, :profile_photo, unique: true
    add_index :user_profiles, :address, unique: true
  end
end
