class DropTableAttachinaryFiles < ActiveRecord::Migration[5.1]
  def change
  	drop_table :attachinary_files
  end
end
