class Message < ApplicationRecord
	belongs_to :user
    validates :buyer_full_name, :buyer_phone_number, :buyer_email, :buyer_message, :user_id, presence: true
end
