class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_locale, :tout_les_ad_types, :tout_les_property_types, :newsletter, :current_year
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
        { locale: I18n.locale }
    end

    def tout_les_ad_types
        @ad_types = Property::AD_TYPE
    end

    def tout_les_property_types
        @property_types = Property::PROPERTY_TYPE
    end

    def newsletter
        @newsletter = Newsletter.new
    end

    def current_year
        @current_year = Time.now.year
    end

    def after_sign_in_path_for(resource)
        edit_user_registration_path(resource) if current_user.first_name.blank? && current_user.last_name.blank? && current_user.phone_number.blank?
    end


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:role, :first_name, :last_name, :profile_picture, :phone_number])
    end

end
