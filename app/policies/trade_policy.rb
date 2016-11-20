# TradePolicy
#  - the authorization policy for trades controller
#
class TradePolicy < ApplicationPolicy
  def index?
    account
  end
end
