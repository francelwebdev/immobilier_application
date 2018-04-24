class PagesController < ApplicationController
    skip_before_action :authenticate_user!

    def home

    end

    def faq

    end

    def terms_and_conditions

    end

    def benefits_for_agency

    end

    def pricing

    end

end
