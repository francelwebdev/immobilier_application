class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  ROLE = ["Particulier", "Profesionnel"]

  has_one :user_role

  has_many :properties, dependent: :destroy

  mount_uploader :profile_photo, ProfilePhotoUploader
end
