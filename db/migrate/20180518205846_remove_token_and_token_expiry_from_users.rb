class RemoveTokenAndTokenExpiryFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :token, :string
    remove_column :users, :token_expiry, :datetime
  end
end
