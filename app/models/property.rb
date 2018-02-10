class Property < ApplicationRecord
  belongs_to :type_of_property
  belongs_to :type_of_transaction
  belongs_to :user
end
