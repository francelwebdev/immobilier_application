class Property < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :user

    belongs_to :ad_type

    belongs_to :property_type

    scope :published, -> { where(published: true) }

    has_many_attached :photos

    after_destroy :suprimer_les_photos

    private

    def suprimer_les_photos
        self.photos.purge
    end
end
