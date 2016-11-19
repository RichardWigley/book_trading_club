# ContactPolicy
#   - the authorization policy for contacts controller
#
class ContactPolicy < ApplicationPolicy
  def edit?
    resource.account == account
  end

  def update?
    resource.account == account
  end
end
