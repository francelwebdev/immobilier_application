class NewslettersController < ApplicationController
    skip_before_action :authenticate_user!

    # def create
    #     @newsletter = Newsletter.new(newsletter_params)
    #     if @newsletter.valid? && @newsletter.save
    #         @newsletter.subscribe
    #         redirect_to root_path, notice: "Merci de vous inscrire à la liste de diffusion!"
    #     else
    #         flash[:alert] = "Il y a eu une erreur, réessayez"
    #     end
    # end

    def create
        @newsletter = Newsletter.new(newsletter_params)
        if @newsletter.save
            redirect_to request.referrer, notice: "Merci de vous inscrire à la newsletter."
        else
            flash[:alert] = "Il y a eu une erreur, réessayez"
            redirect_to request.referrer
        end
    end

    private

    def newsletter_params
        params.require(:newsletter).permit(:email)
    end
end
