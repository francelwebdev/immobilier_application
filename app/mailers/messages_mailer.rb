class MessagesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.messages_mailer.send_message_to_owner.subject
  #
  def send_message_to_owner(ower_id, message_infos)
    # @greeting = "Hi"
    #
    # mail to: "to@example.org"

    @owner = ower_id
    @message_infos = message_infos

    mail to: @owner.email, subject: "Un nouveau message pour votre annonce", from: @message_infos.buyer_email
  end

end
