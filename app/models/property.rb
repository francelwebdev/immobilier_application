class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    ROOM = ["1 pièce", "2 pièces", "3 pièces", "4 pièces", "5 pièces", "plus de 5 pièces"].sort
    FEATURE = ["Electricité", "Eau", "WC", "Internet"].sort
    ETAGE = ["Rez-de-chaussée", "1er étage", "2ème étage", "3ème étage", "4ème étage", "5ème étage", "6ème étage", "7ème étage"].sort
    AD_TYPE = ["À louer", "À vendre"].sort
    PROPERTY_TYPE = ["Appartement", "Maison", "Bureau", "Boutique", "Villa", "Chambre", "Magasin", "Terrain", "Parcelle", "Immeuble"].sort
    AVAILABLE = { Oui: :true, Nom: :false }.sort
    CITY = "Banikoara Gogounou Kandi Karimama Malanville Segbana Boukoumbé Cobly Kérou Kouandé Matéri Natitingou Pehonko Tanguiéta Toucountouna Abomey-Calavi Allada Kpomassè Ouidah Sô-Ava Toffo Tori-Bossito Zè Bembéréké Kalalé N'Dali Nikki Parakou Pèrèrè Sinendé Tchaourou Bantè Dassa-Zoumè Glazoué Ouèssè Savalou Savè Aplahoué Djakotomey Dogbo Klouékanmè Lalo Toviklin Bassila Copargo Djougou Ouaké Cotonou Athiémé Bopa Comè Grand-Popo Houéyogbé Lokossa Adjarra Adjohoun Aguégués Akpro-Missérété Avrankou Bonou Dangbo Porto-Novo Sèmè-Kpodji Ifangni Adja-Ouèrè Kétou Pobè Sakété Abomey Agbangnizoun Bohicon Covè Djidja Ouinhi Za-Kpota Zagnanado Zogbodomey".split.sort

    belongs_to :user
    # belongs_to :agency

    validates :price, :description, :city, :address, :area, :property_type, :ad_type, :title, :available, presence: true
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
