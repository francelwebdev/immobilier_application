class Contact < ApplicationRecord
    validates :first_name, :last_name, :phone_number, :email_address, :message, presence: true
end
