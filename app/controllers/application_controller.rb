class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_locale
    before_action :tout_les_ad_types, :tout_les_property_types, :newsletter    
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
        { locale: I18n.locale }
    end

    def tout_les_ad_types
        @ad_types = Property::ADTYPE
    end

    def tout_les_property_types
        @property_types = Property::PROPERTYTYPE
    end

    def newsletter
        @newsletter = Newsletter.new
    end



    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_group_id, :first_name, :last_name, :phone_number, :terms_and_conditions])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :profile_photo])
    end

end
