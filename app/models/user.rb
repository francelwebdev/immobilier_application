class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

    validates :first_name, :last_name, :phone_number, :terms_and_conditions, presence: true
    validates :phone_number, uniqueness: true

    after_destroy :suprimer_les_photos

    belongs_to :user_group

    has_many :properties, dependent: :destroy

    has_many :messages

    has_one_attached :profile_photo

    private

    def suprimer_les_photos
        self.profile_photo.purge
    end
end
