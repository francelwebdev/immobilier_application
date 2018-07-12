class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "4 pièces", "5 pièces", "plus de 5 pièces"].sort
    FEATURE = ["Electricité", "Eau", "WC", "Internet"].sort
    ETAGE = ["Rez-de-chaussée", "1er étage", "2ème étage", "3ème étage", "4ème étage", "5ème étage", "6ème étage", "7ème étage"].sort
    AVAILABLE = { Oui: :true, Nom: :false }.sort

    belongs_to :user
    belongs_to :city
    belongs_to :ad_type
    belongs_to :property_type
    # belongs_to :agency

    validates :price, :description, :city_id, :address, :area, :property_type_id, :ad_type_id, :title, :available, presence: true
    validates :title, uniqueness: true
    validates :area, numericality: { only_integer: true }
    validates :deposit, numericality: { only_integer: true, greeter_than_or_egal_to: 0 }, allow_blank: true

    has_many_attached :images

    scope :published, -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }

    before_save :mettre_tout_en_minuscule
    before_create :definir_la_date_dexpiration
    after_create :suprimer_si_annonce_expire
    after_destroy :suprimer_les_photos


    private

    def mettre_tout_en_minuscule
        self.title.downcase!
        self.description.downcase!
        self.address.downcase!
    end

    def definir_la_date_dexpiration
        self.published_at = Date.today
        self.expire_at = Date.today + 2.weeks
    end

    def suprimer_si_annonce_expire
        p = Property.find(self.id)
        if p.published? && p.expire_at.past?
            p.delete
        end
    end

    def suprimer_les_photos
        self.images.purge
    end

end
