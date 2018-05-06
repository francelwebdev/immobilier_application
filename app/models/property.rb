class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged    

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "plus de 3 pièces"]
    FEATURE = ["Electricité", "Eau", "WC", "Internet", "Commerces à proximité"]
    ETAGE = ["Rez-de-chaussée", "1er étage", "2ème étage", "3ème étage", "4ème étage", "5ème étage"]

    belongs_to :user

    belongs_to :ad_type

    belongs_to :property_type

    validates :price, :area, :description, :address, :city, :room, :available, :published, :avance, :property_type_id, :ad_type_id, :feature, :etage, presence: true

    validates :title, presence: { message: "ne doit pas être vide." }

    scope :published, -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }

    has_many_attached :photos

    after_destroy :suprimer_les_photos

    private

    def suprimer_les_photos
        self.photos.purge
    end
end
