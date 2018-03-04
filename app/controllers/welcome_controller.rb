class WelcomeController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]

  def index
    @ad_type = AdType.all
    @property_type = PropertyType.all
  end
end
