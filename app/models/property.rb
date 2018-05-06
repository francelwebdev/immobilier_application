class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged    

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "plus de 3 pièces"]
    FEATURE = ["Electricité", "Eau", "WC", "Internet", "Commerces à proximité"]
    ETAGE = ["Rez-de-chaussée", "1er étage", "2ème étage", "3ème étage", "4ème étage", "5ème étage"]
    ADTYPE = ["Location"]
    PROPERTYTYPE = ["Appartement", "Maison", "Bureau", "Boutique", "Villa"]

    belongs_to :user

    validates :price, :area, :description, :address, :city, :room, :available, :avance, :property_type, :ad_type, :feature, :etage, presence: true

    validates :title, presence: { message: "ne doit pas être vide." }

    scope :published, -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }

    has_many_attached :photos

    after_destroy :suprimer_les_photos
    after_create :suprimer_si_annonce_expire

    private

    def suprimer_les_photos
        self.photos.purge
    end

    def suprimer_si_annonce_expire
         expiration = 3.minute.since(self.published_at)
        self.update published: false if self.published_at > expiration
    end
end
