# BookPolicy
#  - the authorization policy for books controller
#
class BookPolicy < ApplicationPolicy
  def index?
    account
  end

  def new?
    account
  end
end
