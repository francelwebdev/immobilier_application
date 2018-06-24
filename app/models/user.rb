class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :confirmable
  devise :omniauthable, omniauth_providers: %i[facebook]

  ROLE = ["Propriétaire", "Agent immobilier"]

  validates :group_id, presence: true, on: :create
  validates :group_id, presence: true, on: :update
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :phone_number, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 8 }, on: :update

  after_create :send_welcome_email
  after_destroy :suprimer_photo_de_profile
  after_create :init_agency_or_profile

  belongs_to :group
  has_one :agency, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :messages
  has_one_attached :profile_picture

  def init_agency_or_profile
    if self.group_id == 2
        self.build_agency
    end
  end


  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    # user.name = auth.info.name   # assuming the user model has a name
    # user.image = auth.info.image # assuming the user model has an image

    user.name = auth.info.name
    user.profile_picture = auth.info.profile_pic
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name

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
    self.profile_picture.purge
  end
end
