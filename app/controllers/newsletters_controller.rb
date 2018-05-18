class NewslettersController < ApplicationController
    skip_before_action :authenticate_user!

    def create
        @newsletter = Newsletter.new(secure_params_newsletter)
        if @newsletter.valid? && @newsletter.save
            @newsletter.subscribe
            redirect_to root_path, notice: "Merci de vous inscrire à la liste de diffusion!"
        else
            flash[:alert] = "Il y a eu une erreur, réessayez"
        end
    end

    private

    def secure_params_newsletter
        params.require(:newsletter).permit(:email)
    end
end
