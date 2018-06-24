class PropertyFeature < ApplicationRecord
    FEATURE = ["Electricité", "Eau", "WC", "Internet"]
	
  belongs_to :property
end
