class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

    validates :first_name, :last_name, :phone_number, :terms_and_conditions, presence: true
    validates :phone_number, uniqueness: true
    
    has_many :properties, dependent: :destroy
        
    has_one_attached :profile_photo
end
