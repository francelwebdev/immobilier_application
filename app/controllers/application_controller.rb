class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Debut mon code
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :current_password])
  end
  # Fin mon code
end
