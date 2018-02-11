class Profile < ApplicationRecord
  belongs_to :user
  has_many :properties

  extend FriendlyId
  friendly_id :first_name, use: :slugged
end
