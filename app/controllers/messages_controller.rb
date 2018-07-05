class MessagesController < ApplicationController
    skip_before_action :authenticate_user!

	def create
		@user = User.find(params[:message][:user_id])
		@message = @user.messages.build(message_params)
		if @message.valid?
	    	MessagesMailer.send_message_to_owner(@user, @message).deliver_now
            redirect_to request.referrer, notice: "Message envoyé avec succès"
        else
            redirect_to request.referrer, alert: "Le message n'a pas été envoyé, car le formulaire n'a pas été bien remplir."
		end
	end

	private

	def message_params
		params.require(:message).permit(:user_id, :name, :phone, :email, :message)
	end
end
