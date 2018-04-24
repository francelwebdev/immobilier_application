class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      redirect_to home_page_path, notice: "Message envoyé avec succès, nous vous contacterons dans les plus brefs délai."
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :email_address, :message)
  end
end
