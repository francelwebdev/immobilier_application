class ChangeExpireAtColumnAndPublishedAtColumnInTableProperties < ActiveRecord::Migration[5.2]
  def change
      change_column :properties, :published_at, :date
      change_column :properties, :expire_at, :date
  end
end
