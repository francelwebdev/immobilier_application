class Property < ApplicationRecord

    extend FriendlyId
    friendly_id :title, use: :slugged

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "4 pièces", "5 pièces", "plus de 5 pièces"]

    belongs_to :user
    belongs_to :ad_type
    belongs_to :property_type

    has_many :property_photos, dependent: :destroy

    accepts_nested_attributes_for :property_photos, allow_destroy: true
end
