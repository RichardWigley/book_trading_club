# AccountsController
#  - actions associated with the account
#  - account is the information held on a user
#
class AccountsController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def show
    @account = current_account
    @trades = []
    authorize Account
  end

  def edit
    @account = Account.find(params[:id])
    authorize @account
  end

  def update
    @account = Account.find(params[:id])
    redirect_to accounts_show_path
    authorize @account
  end
end
