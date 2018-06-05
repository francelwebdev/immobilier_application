class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :confirmable
  devise :omniauthable, omniauth_providers: %i[facebook]

  after_create :send_welcome_email
  after_destroy :suprimer_photo_de_profile

  has_many :properties, dependent: :destroy
  has_many :messages
  has_one_attached :picture

  ROLE = ["Propriétaire", "Agent immobilier"]
  GENDER = ["Masculin", "Féminin"]

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    #user.name = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image

    user.first_name = auth.info.first_name   # assuming the user model has a name
    user.last_name = auth.info.last_name   # assuming the user model has a name
    user.picture = auth.info.picture # assuming the user model has an image

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

  def suprimer_photo_de_profile
    self.picture.purge
  end
end
