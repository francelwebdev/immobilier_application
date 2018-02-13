class WelcomeController < ApplicationController
  def index
    @ad_type = AdType.all
    @property_type = PropertyType.all
  end
end
