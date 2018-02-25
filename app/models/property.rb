class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :ad_type
  belongs_to :user
  belongs_to :room

  accepts_nested_attributes_for :user
end
