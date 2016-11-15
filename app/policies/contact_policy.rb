# ContactPolicy
#   - the authorization policy for contacts controller
#
class ContactPolicy < ApplicationPolicy
  def edit?
    account
  end

  def update?
    account
  end
end
