class Property < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :ad_type
  belongs_to :property_type
  has_many :property_photos, dependent: :destroy
  belongs_to :user

  validates :title, :price, :area, :ad_type_id, :property_type_id, :description, :city, :address, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  accepts_nested_attributes_for :property_photos, allow_destroy: true
  accepts_nested_attributes_for :user
end
