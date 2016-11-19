# OfferPolicy
#  - the authorization policy for offers controller
#
class OfferPolicy < ApplicationPolicy
  def index?
    account
  end

  def new?
    resource.account == account
  end

  def create?
    resource.account == account
  end

  def show?
    resource.account == account
  end

  def destroy?
    resource.account == account
  end
end
