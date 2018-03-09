class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?


# Le code ci-dessous permet de rediriger l'utilisateur vers un autre page après connexion
  def after_sign_in_path_for(resource)
	  my_ads_path() #your path
	end
# ok

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :profile_photo])
  end
end
