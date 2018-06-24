class Agency < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_many :properties
    belongs_to :user
end
