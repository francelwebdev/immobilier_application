class AddGenderToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :gender, :string
  end
end
