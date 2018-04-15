class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

    validates :role, :username, :terms_and_conditions, presence: true
    validates :username, uniqueness: { message: "Le nom d'utilisateur existe déja !" }

    ROLE = ["Un particulier"]

    has_one :user_profile, dependent: :destroy

    belongs_to :user_role, dependent: :destroy

    after_create :creation_profile_vierge

    has_many :properties, dependent: :destroy

    def creation_profile_vierge
        self.create_user_profile!
    end
end
