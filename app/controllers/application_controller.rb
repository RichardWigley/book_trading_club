# ApplicationController
#  - base controller for the application
#
class ApplicationController < ActionController::Base
  include Pundit

  # pundit_user
  #  - customize pundit user away from current_user
  #
  def pundit_user
    current_account
  end

  # Pundit::NotAuthorizedError
  #  - catching unauthorized exceptions from Pundit
  #
  rescue_from Pundit::NotAuthorizedError, with: :account_not_authorized

  protect_from_forgery with: :exception

  private

  def account_not_authorized
    flash[:alert] = 'Access Denied'
    redirect_to(request.referrer || new_account_session_path)
  end

  # overwriting devise logout path
  def after_sign_out_path_for(_resource_or_scope)
    logged_out_path
  end
end
