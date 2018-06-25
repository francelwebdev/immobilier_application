class Agency < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    belongs_to :user
    has_many :properties
end
