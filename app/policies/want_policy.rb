# WantPolicy
#   - the authorization policy for wants controller
#
class WantPolicy < ApplicationPolicy
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
