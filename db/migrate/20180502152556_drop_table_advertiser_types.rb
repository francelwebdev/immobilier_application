class DropTableAdvertiserTypes < ActiveRecord::Migration[5.2]
  def change
  	drop_table :advertiser_types
  end
end
