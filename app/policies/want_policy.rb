# WantPolicy
#   - the authorization policy for wants controller
#
class WantPolicy < ApplicationPolicy
  def index?
    account
  end
end
