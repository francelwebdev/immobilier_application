class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactsMailer.contact_us(@contact).deliver_now
      redirect_to home_page_path, notice: "Merci de nous avoir contacté ! Votre message a été envoyé, nous reviendrons vers vous rapidement."
    else
      flash.now[:alert] = "Le message n'a pas été envoyé, car le formulaire n'a pas été bien remplir."
      render "pages/contact_us"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :email, :message)
  end
end
