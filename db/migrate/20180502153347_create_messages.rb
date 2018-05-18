class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :buyer_full_name
      t.string :buyer_email
      t.integer :buyer_phone_number, limit: 8
      t.text :buyer_message

      t.timestamps
    end
  end
end
