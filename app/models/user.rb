class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

    has_person_name    

    ROLE = ["Agent immobilier", "Propriétaire"].sort
    GENDER = { M: :Male, F: :Female }

    validates :name, presence: true
    validates :role, presence: true
    validates :phone_number, presence: true
    validates :phone_number, uniqueness: true, numericality: { only_integer: true }, length: { is: 8 }

    # before_create :create_administrator
    after_create :send_welcome_email
    # after_destroy :suprimer_photo_de_profile
    # after_create :build_agency_or_profile

    # has_one :agency, dependent: :delete
    has_many :properties, dependent: :delete_all
    has_many :messages
    has_one_attached :profile_picture, dependent: :purge
    

    private

    def send_welcome_email
        NotificationsMailer.with(usr: self).welcome_email.deliver_now
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
