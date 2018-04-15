class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  validates :role, :first_name, :last_name, :phone_number, :terms_and_conditions, presence: true

  ROLE = ["Particulier", "Profesionnel"]

  has_one :user_role

  has_many :properties, dependent: :destroy

  mount_uploader :profile_photo, ProfilePhotoUploader
end
