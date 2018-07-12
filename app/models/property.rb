class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "4 pièces", "5 pièces", "plus de 5 pièces"]
    FEATURE = ["Electricité", "Eau", "WC", "Internet"]
    ETAGE = ["Rez-de-chaussée", "1er étage", "2ème étage", "3ème étage", "4ème étage", "5ème étage", "6ème étage", "7ème étage"]
    AD_TYPE = ["À louer", "À vendre"]
    PROPERTY_TYPE = ["Appartement", "Maison", "Bureau", "Boutique", "Villa", "Chambre", "Magasin", "Terrain", "Parcelle", "Immeuble"]
    AVAILABLE = { Oui: :true, Nom: :false }
    CITY = ["Abomey-Calavi", "Allada", "Aplahoué", "Banikoara", "Bantè", "Bassila", "Bembéréké", "Boukoumbé", "Cobly", "Copargo", "Dassa-Zoumè", "Djakotomey", "Djougou", "Dogbo", "Glazoué", "Gogounou", "Kalalé", "Kandi", "Karimama", "Klouékanmè", "Kouandé", "Kpomassè", "Kérou", "Lalo", "Malanville", "Matéri", "N'Dali", "Natitingou", "Nikki", "Ouaké", "Ouidah", "Ouèssè", "Parakou", "Pehonko", "Pèrèrè", "Savalou", "Savè", "Segbana", "Sinendé", "Sô-Ava", "Tanguiéta", "Tchaourou", "Toffo", "Tori-Bossito", "Toucountouna", "Toviklin", "Zè"]

    belongs_to :user, dependent: :destroy
    # belongs_to :agency

    validates :price, :description, :city, :address, :area, :property_type, :ad_type, :title, :available, presence: true
    validates :title, uniqueness: true
    validates :area, numericality: { only_integer: true }
    validates :deposit, numericality: { only_integer: true, greeter_than_or_egal_to: 0 }

    has_many_attached :images

    scope :published, -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }

    before_create :definir_la_date_dexpiration
    after_create :suprimer_si_annonce_expire
    after_destroy :suprimer_les_photos


    private

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
        self.images.purge_later
    end

end
