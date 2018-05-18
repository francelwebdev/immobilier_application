class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    # @greeting = "Hi"

    # mail to: "to@example.org"

    @user = user

    mail(to: @user.email, subject: 'Bienvenue sur SICO')
  end
end
