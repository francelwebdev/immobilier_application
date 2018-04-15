class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

    # mon code

    before_action :tout_les_ad_types, :tout_les_property_types

    before_action :authenticate_user!

    before_action :newsletter


    # mon code


    before_action :configure_permitted_parameters, if: :devise_controller?

    protected	

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :username, :terms_and_conditions])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username])
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
