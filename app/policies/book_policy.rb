# BookPolicy
#  - the authorization policy for books controller
#
class BookPolicy < ApplicationPolicy
  def index?
    account
  end
end
