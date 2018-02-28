class PropertyPhoto < ApplicationRecord
    belongs_to :property

    mount_uploader :title, PropertyPhotoUploader
end
