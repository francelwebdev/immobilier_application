class DropTableSpecialties < ActiveRecord::Migration[5.1]
  def change
  	drop_table :specialties
  end
end
