class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "plus de 3 pièces"]

    belongs_to :user

    belongs_to :ad_type

    belongs_to :property_type

    has_many_attached :property_photos

    scope :published, -> { where(published: true) }
end
