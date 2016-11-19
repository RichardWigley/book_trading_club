# AccountPolicy
#   - the authorization policy for accounts controller
#
class AccountPolicy < ApplicationPolicy
  def show?
    resource == account
  end
end
