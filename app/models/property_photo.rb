class PropertyPhoto < ApplicationRecord
    belongs_to :property

    mount_uploader :name, PropertyPhotoUploader
end
