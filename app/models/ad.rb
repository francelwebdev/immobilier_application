class Ad < ApplicationRecord
  belongs_to :type_of_property
  belongs_to :type_of_transaction
end
