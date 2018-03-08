class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# Le code ci-dessous permet de rediriger l'utilisateur vers un autre page après connexion
  def after_sign_in_path_for(resource)
	  new_property_path(current_user) #your path
	end
# ok

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :profile_photo])
  end
end
