class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  validates :role, :username, :terms_and_conditions, presence: true
  validates :username, uniqueness: { message: "Le nom d'utilisateur existe déja !" }

  ROLE = ["Un particulier"]

  has_one :user_profile

  has_many :properties, dependent: :destroy
end
