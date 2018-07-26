class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    FEATURE = ["Electricité", "Eau", "WC", "Internet"].sort
    ETAGE = ["Rez-de-chaussée", "1er étage", "2ème étage", "3ème étage", "4ème étage", "5ème étage", "6ème étage", "7ème étage"].sort
    AVAILABLE = { Oui: :TRUE, Nom: :FALSE }

    belongs_to :user
    belongs_to :city
    belongs_to :ad_type
    belongs_to :property_type
    belongs_to :room
    # belongs_to :agency

    validates :price, :description, :address, :area, :title, presence: true
    validates :etage, presence: true, allow_blank: true
    validates :available, presence: true, inclusion: { in: ["TRUE", "FALSE"] }, allow_blank: true
    validates :title, uniqueness: true
    validates :area, numericality: { only_integer: true }
    validates :deposit, numericality: { only_integer: true, greeter_than_or_egal_to: 0 }, allow_blank: true
    validates_associated :user

    has_many_attached :images, dependent: :purge_later

    scope :published, -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }

    before_save :mettre_tout_en_minuscule
    before_create :definir_la_date_dexpiration
    after_create :suprimer_si_annonce_expire
    # after_destroy :suprimer_les_photos


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

    # def suprimer_les_photos
    #     self.images.purge
    # end

end
