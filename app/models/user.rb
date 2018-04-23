class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

    validates :user_group_id, :first_name, :last_name, :phone_number, :address, :terms_and_conditions, presence: true
    validates :phone_number, :address, uniqueness: true

    has_one_attached :profile_photo

    has_many :properties, dependent: :destroy
end
