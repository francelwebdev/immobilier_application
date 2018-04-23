class CreateAdvertiserTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :advertiser_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :advertiser_types, :name, unique: true
  end
end
