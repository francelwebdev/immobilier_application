class DropTableAdTypes < ActiveRecord::Migration[5.2]
  def change
  	drop_table :ad_types
  end
end
