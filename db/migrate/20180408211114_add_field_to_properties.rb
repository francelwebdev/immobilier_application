class AddFieldToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :published, :boolean
  end
end
