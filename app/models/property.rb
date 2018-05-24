class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "4 pièces", "5 pièces", "plus de 5 pièces"]
    FEATURE = ["Electricité", "Eau", "WC", "Internet"]
    ETAGE = ["Rez-de-chaussée", "1er étage", "2ème étage", "3ème étage", "4ème étage", "5ème étage"]
    AD_TYPE = ["Location"]
    PROPERTY_TYPE = ["Appartement", "Maison", "Bureau", "Commerce", "Villa", "Sanitaire"]

    belongs_to :user

    validates :price, :area, :description, :address, :city, :room, :available, :avance, :property_type, :ad_type, :feature, :etage, :title, presence: true

    scope :published, -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }

    has_many_attached :photos

    after_destroy :suprimer_les_photos
    after_create :suprimer_si_annonce_expire

    accepts_nested_attributes_for :user, reject_if: :new_record?

    private

    def suprimer_les_photos
        self.photos.purge
    end

    def suprimer_si_annonce_expire
        if self.expiration_date.past?
            Property.find(self.id).delete
        end
    end
end
