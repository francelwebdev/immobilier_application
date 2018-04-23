class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

    # mon code
    before_action :authenticate_user!
    before_action :tout_les_ad_types, :tout_les_property_types
    before_action :newsletter
    # mon code

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected	

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_group_id, :first_name, :last_name, :terms_and_conditions])
		devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number, :address])
	end


    private

    # mon code
    def tout_les_ad_types
        @ad_types = AdType.all
    end

    def tout_les_property_types
        @property_types = PropertyType.all
    end

    def newsletter
        @newsletter = Newsletter.new
    end
    # mon code
end
