class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def contact_email(contact)
    @contact = contact
    mail to: "francel.webdev@gmail.com", subject: "Nouveau message d'un utilisateur ou visiteur dépuis SICO Immobilier", from: @contact.email_address
  end
end
