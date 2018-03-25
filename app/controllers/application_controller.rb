class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!

    # mon code
        before_action :tout_les_ad_type
    # mon code

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :profile_photo])
	end


    # mon code
        def tout_les_ad_type
            @ad_types = AdType.all
        end
    # mon code
end
