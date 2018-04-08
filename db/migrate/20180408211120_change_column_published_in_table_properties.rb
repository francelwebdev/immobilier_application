class ChangeColumnPublishedInTableProperties < ActiveRecord::Migration[5.1]
  def change
    change_column :properties, :published, :boolean, default: false
  end
end
