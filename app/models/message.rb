class Message < ApplicationRecord
	belongs_to :user
    validates :customer_full_name, :customer_phone_number, :customer_email, :customer_message, :user_id, presence: true
end
