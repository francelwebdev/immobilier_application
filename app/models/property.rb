class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :ad_type
  belongs_to :user
  has_many :property_photos

  validates :title, presence: true
  validates :price, presence: true
  validates :area, presence: true
  validates :ad_type_id, presence: true
  validates :property_type_id, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :user, allow_destroy: true
  accepts_nested_attributes_for :property_photos, allow_destroy: true
end
