class AddCreatedAtAndUpdatedAtToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :created_at, :datetime, null: false
    add_column :properties, :updated_at, :datetime, null: false
  end
end
