class AddExpirationDateToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :expiration_date, :datetime
  end
end
