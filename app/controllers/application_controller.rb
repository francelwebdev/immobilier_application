class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_locale, :current_year
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
        { locale: I18n.locale }
    end

    def current_year
        @current_year = Date.today.year
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :role, :gender, :profile_picture])
    end

    def after_sign_in_path_for(resource)
        edit_user_registration_path
    end
end
