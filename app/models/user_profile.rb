class UserProfile < ApplicationRecord

    belongs_to :user
    has_many :properties

    mount_uploader :profile_photo, ProfilePhotoUploader
end
