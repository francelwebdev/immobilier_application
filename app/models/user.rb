class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

    validates :im, :first_name, :last_name, :phone_number, :terms_and_conditions, presence: true
    validates :phone_number, uniqueness: true

    after_create :init_profile
    after_destroy :suprimer_les_photos

    has_many :properties, dependent: :destroy

    has_many :messages

    has_one :profile, dependent: :destroy

    has_one_attached :profile_photo

    IM = ["Propriétaire", "Agent immobilier"]

    private

    def init_profile
        self.create_profile
    end

    def suprimer_les_photos
        self.profile_photo.purge
    end
end
