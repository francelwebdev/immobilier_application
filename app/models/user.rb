class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

    validates :role, :terms_and_conditions, presence: true
    # validates :phone_number, uniqueness: true

    after_create :send_welcome_email
    after_destroy :suprimer_les_photos

    has_many :properties, dependent: :destroy

    has_many :messages

    has_one_attached :profile_photo

    ROLE = ["Propriétaire", "Agent immobilier"]
    GENDER = ["Masculin", "Féminin"]

    private

    def send_welcome_email
        UserMailer.welcome(self).deliver_now
    end

    def suprimer_les_photos
        self.profile_photo.purge
    end
end
