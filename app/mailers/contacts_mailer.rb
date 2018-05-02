class ContactsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contacts_mailer.contact_us.subject
  #
  def contact_us(contact_infos)
    # @greeting = "Hi"

    # mail to: "to@example.org"

    @contact_infos = contact_infos
    mail to: "francel.webdev@gmail.com", subject: "Nouveau message dépuis SICO Immobilier", from: @contact_infos.email_address
  end

  def contact_seller(contact_infos)
    @contact_infos = contact_infos

    mail to: "", subject: "Un nouveau message pour votre annonce : "
  end
end
