class AddPublishedAtToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :published_at, :datetime
  end
end
