class CreatePropertyPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :property_photos do |t|
      t.string :title

      t.timestamps
    end
  end
end
