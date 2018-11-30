class NotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.welcome.subject
  #
  # def welcome
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end

  def welcome_email
    @user = params[:usr]
    mail(to: @user.email, subject: 'Bienvenue sur SICO')
  end

  def send_message_to_owner
    @user = params[:usr]
    @message = params[:message]
    mail to: @user.email, subject: "Nouveau message pour votre annonce", from: @message.email
  end

  def contact_us
    @contact_infos = params[:contact]
    mail to: "support@amadev.xyz", subject: "Nouveau message dépuis SICO", from: @contact_infos.email
  end
end
