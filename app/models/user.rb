class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

    belongs_to :user_group
    has_many :properties, dependent: :destroy
    has_one_attached :profile_photo
end
