# TradesController
#  - actions associated with book trades
#
class TradesController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def index
    @trades = []
    authorize Trade
  end
end
