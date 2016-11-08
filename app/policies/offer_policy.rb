# OfferPolicy
#  - the authorization policy for offers controller
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

  def show?
    resource.account_id == account.id
  end

  def destroy?
    resource.account_id == account.id
  end
end
