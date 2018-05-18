class NewslettersController < ApplicationController
    skip_before_action :authenticate_user!

    def create
        @newsletter = Newsletter.new(secure_params_newsletter)
        if @newsletter.valid? && @newsletter.save
            @newsletter.subscribe
            redirect_to root_path, notice: "Thank you for signing up to the mailing list!"
        else
            flash[:alert] = "There was an error, try again"            
        end
    end

    private

    def secure_params_newsletter
        params.require(:newsletter).permit(:email)
    end
end
