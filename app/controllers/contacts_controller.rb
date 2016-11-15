# ContactsController
#  - actions associated with contact
#  - contact is the contact information held on an account
#
class ContactsController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def edit
    @contact = Contact.find(params[:id])
    authorize @contact
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(contact_param)
      redirect_to accounts_show_path, notice: 'Contact details updated'
    else
      render :edit
    end
    authorize @contact
  end

  private

  def contact_param
    params.require(:contact)
          .permit(:full_name, :address_line_1, :address_line_2, :town, :county, :postcode)
  end
end
