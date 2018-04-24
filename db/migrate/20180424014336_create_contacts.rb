class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number, limit: 8
      t.string :email_address
      t.text :message

      t.timestamps
    end
  end
end
