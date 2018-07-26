class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    devise :confirmable
    devise :omniauthable, omniauth_providers: %i[facebook]

    ROLE = ["Agent immobilier", "Propriétaire"].sort
    GENDER = { M: :Male, F: :Female }

    validates :role, presence: true, on: :create
    #validates :role, presence: true, on: :update
    validates :first_name, :last_name, :phone_number, presence: true, on: :update
    validates :phone_number, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 8 }, on: :update

    before_create :create_administrator
    after_create :send_welcome_email
    # after_destroy :suprimer_photo_de_profile
    # after_create :build_agency_or_profile

    # has_one :agency, dependent: :delete
    has_many :properties, dependent: :delete_all
    has_many :messages
    has_one_attached :profile_picture, dependent: :purge_later

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
            # user.name = auth.info.name   # assuming the user model has a name
            # user.image = auth.info.image # assuming the user model has an image

            user.profile_picture = auth.info.picture
            user.first_name = auth.info.first_name
            user.last_name = auth.info.last_name
            # user.token = auth.credentials.token
            # user.token_expires_at = Time.at(auth.credentials.expires_at)

            # If you are using confirmable and the provider(s) you use validate emails,
            # uncomment the line below to skip the confirmation emails.
            user.skip_confirmation!
        end
    end

    def self.new_with_session(params, session)
        super.tap do |user|
            if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
                user.email = data["email"] if user.email.blank?
            end
        end
    end

    private

    def send_welcome_email
        UserMailer.welcome(self).deliver_now
    end

    # def suprimer_photo_de_profile
    #     self.profile_picture.purge if self.profile_picture.present?
    # end

    def create_administrator
        if self.email == "francel.webdev@gmail.com"
            self.admin = true
        end
    end

    # def build_agency_or_profile
    #   if self.role == "Agent immobilier"
    #       Agency.create user_id: self.id
    #   end
    # end

end
