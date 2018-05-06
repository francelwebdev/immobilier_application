class MessagesController < ApplicationController
    skip_before_action :authenticate_user!

	def send_message_to_owner
		@owner = User.find(params[:message][:user_id])
		@message = @owner.messages.build(message_params)
		if @message.valid?
	    	MessagesMailer.send_message_to_owner(@owner, @message).deliver_now
            redirect_to(request.referrer, notice: "Message envoyé avec succès")
        else
            redirect_to(request.referrer, alert: "Le message n'a pas été envoyé, car le formulaire n'a pas été bien remplir.")
		end
	end

	private

	def message_params
		params.require(:message).permit(:user_id, :buyer_full_name, :buyer_phone_number, :buyer_email, :buyer_message)
	end
end
