# BookPolicy
#  - the authorization policy for books controller
#
class OfferPolicy < ApplicationPolicy
  def index?
    account
  end

  def new?
    resource.account_id == account.id
  end

  def create?
    resource.account_id == account.id
  end
end
