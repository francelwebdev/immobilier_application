class Property < ApplicationRecord

    extend FriendlyId
    friendly_id :title, use: :slugged


    ROOM = ["1 pièce", "2 pièces", "3 pièces", "plus de 3 pièces"]
    BEDROOM = ["1 chambre", "2 chambres", "3 chambres", "plus de 3 chambres"]
    BATHROOM = ["1 salle de bain", "2 salle de bain", "3 salle de bain", "plus de 3 salle de bain"]

    belongs_to :user
    belongs_to :user_profile
    belongs_to :ad_type
    belongs_to :property_type

    has_many :property_photos, dependent: :destroy

    accepts_nested_attributes_for :property_photos, allow_destroy: true
    accepts_nested_attributes_for :user_profile, allow_destroy: true


    scope :published, -> { where(published: true) }
end
