class MessagesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.messages_mailer.send_message_to_owner.subject
  #
  def send_message_to_owner(user, message)
    # @greeting = "Hi"
    #
    # mail to: "to@example.org"

    @user = user
    @message = message

    mail to: @user.email, subject: "Un nouveau message pour votre annonce", from: @message.email
  end

end
