# ContactsController
#  - actions associated with contact
#  - contact is the contact information held on an account
#
class ContactsController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def edit
    @contact = Contact.includes(:account).find(params[:id])
    authorize @contact
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.attributes = contact_param
    if @contact.save(context: :complete_contact)
      session[:book_wanted] ? redirect_to_wanted_book : redirect_nothing_sought
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

  def redirect_to_wanted_book
    redirect_to session[:book_wanted], notice: 'Contact details updated'
  end

  def redirect_nothing_sought
    redirect_to accounts_show_path, notice: 'Contact details updated'
  end
end
