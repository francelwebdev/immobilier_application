class Property < ApplicationRecord

    extend FriendlyId
    friendly_id :title, use: :slugged

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "plus de 3 pièces"]
    BEDROOM = ["1 chambre", "2 chambres", "3 chambres", "plus de 3 chambres"]
    BATHROOM = ["1 salle de bain", "2 salle de bain", "3 salle de bain", "plus de 3 salle de bain"]

    belongs_to :user
    belongs_to :ad_type
    belongs_to :property_type
    accepts_nested_attributes_for :user, update_only: true
    scope :published, -> { where(published: true) }
    has_many_attached :property_photos
end
