class PagesController < ApplicationController
    skip_before_action :authenticate_user!

    def home
        
    end

    def contact_us
        @contact = Contact.new
    end

    def faq

    end

    def terms_and_conditions

    end

    def benefits_for_agency

    end

    def benefits_for_owner

    end

    def pricing_plan

    end

end
