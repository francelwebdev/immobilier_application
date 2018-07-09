class DropTableSessions < ActiveRecord::Migration[5.2]
  def change
  	drop_table :sessions
  end
end
