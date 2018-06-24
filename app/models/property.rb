class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "4 pièces", "5 pièces", "plus de 5 pièces"]
    FEATURE = ["Electricité", "Eau", "WC", "Internet"]
    ETAGE = ["Rez-de-chaussée", "1er étage", "2ème étage", "3ème étage", "4ème étage", "5ème étage"]
    AD_TYPE = ["Location"]
    PROPERTY_TYPE = ["Appartement", "Maison", "Bureau", "Boutique", "Villa", "Chambre", "Entrée couché", "Magasin"]
    AVAILABLE = { Oui: :true, Nom: :false }

    validates :price, :description, :city, :deposit, :property_type, :ad_type, :feature, :room, :title, presence: true
    validates :title, uniqueness: true
    validates :price, numericality: true
    validates :price, numericality: { greater_than_or_equal_to: 1 }
    validates :area, numericality: { only_integer: true }
    validates :deposit, numericality: { only_integer: true }
    validates :deposit, numericality: { greater_than_or_equal_to: 1 }

    belongs_to :user
    # belongs_to :agency

    has_many_attached :images

    scope :published, -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }

    # after_update :suprimer_si_annonce_expire
    after_destroy :suprimer_les_photos

    private

    # def suprimer_si_annonce_expire
    #     p = Property.find(self.id)
    #     if p.published? and p.published_at.past?
    #         p.delete
    #     end
    # end

    def suprimer_les_photos
        self.photos.purge_later
    end

end
