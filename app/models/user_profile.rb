class UserProfile < ApplicationRecord

    belongs_to :user

    mount_uploader :profile_photo, ProfilePhotoUploader
end
