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
    redirect_to accounts_show_path
    authorize @contact
  end
end
