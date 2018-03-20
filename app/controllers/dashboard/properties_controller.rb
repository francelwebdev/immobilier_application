class Dashboard::PropertiesController < ApplicationController
  def index
    @my_ads = current_user.properties.all.order("created_at DESC")
    @my_ads_total = @my_ads.count

    # <%= link_to 'Destroy', property, method: :delete, data: { confirm: 'Are you sure?' } %>
  end
end
