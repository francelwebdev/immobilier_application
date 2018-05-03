class MessagesController < ApplicationController
    skip_before_action :authenticate_user!

	def send_message
		@owner = User.find(params[:id])
		@message = @owner.messages.build(message_params)
		if @message.valid?
	    	MessagesMailer.send_message_to_owner(@owner, @message).deliver_now
	    	redirect_to(:back), notice: "Le message a été envoyé avec succès"
		end
        
	end

	private

	def message_params
		params.require(:message).permit(:buyer_full_name, :buyer_phone_number, :buyer_email, :buyer_message)
	end
end
