class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    if @contact.save
      flash.notice = "Contact #{@contact.name} created."
    else
      flash.notice = "Contact not created due to an error."
    end
    redirect_to company_path(@contact.company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :title, :email, :company_id)
  end

end
