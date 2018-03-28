class AddAdTypeRefToProperties < ActiveRecord::Migration[5.1]
  def change
    add_reference :properties, :ad_type, foreign_key: true
  end
end
