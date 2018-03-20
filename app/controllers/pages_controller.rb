class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:home]

    def home
        @ad_types = AdType.all
        @property_type = PropertyType.all
    end
end
