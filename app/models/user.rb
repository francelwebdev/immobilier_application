class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :confirmable
  devise :omniauthable, omniauth_providers: %i[facebook]

  # validates :role, :terms_and_conditions, presence: true

  after_create :send_welcome_email
  after_destroy :suprimer_les_photos

  has_many :properties, dependent: :destroy
  has_many :messages
  has_one_attached :profile_photo

  # ROLE = ["Propriétaire", "Agent immobilier"]
  # GENDER = ["Masculin", "Féminin

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name   # assuming the user model has a name
      user.last_name = auth.info.last_name   # assuming the user model has a name
      user.phone = auth.info.phone   # assuming the user model has a name
      user.gender = auth.info.gender   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
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

  def suprimer_les_photos
    self.profile_photo.purge
  end
end
