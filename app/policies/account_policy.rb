# AccountPolicy
#   - the authorization policy for accounts controller
#
class AccountPolicy < ApplicationPolicy
  def show?
    account
  end

  def edit?
    account
  end

  def update?
    account
  end
end
