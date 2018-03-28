class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

    # mon code
    before_action :tout_les_ad_types
    # mon code
    
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

	# mon code
	def tout_les_ad_types
		@ad_types = AdType.all
	end
	# mon code
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :profile_photo])
	end

end
