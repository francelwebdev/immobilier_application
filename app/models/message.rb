class Message < ApplicationRecord
	belongs_to :user
    validates :name, :phone, :email, :message, :user_id, presence: true
end
