class AddTermsAndConditionsBooleanToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :terms_and_conditions, :boolean, default: false
  end
end
