# WantsController
#   - allowing accounts to want books
#
class WantsController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def index
    authorize Want
  end
end
