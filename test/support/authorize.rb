# Authorize
#  - module to verify permissions on pundit
#
module Authorize
  def assert_permit(account, record, action)
    assert permit(account, record, action),
           "Account #{account.inspect} should be permitted to #{action} #{record}, but isn't permitted"
  end

  def refute_permit(account, record, action)
    refute permit(account, record, action),
           "Account #{account.inspect} should NOT be permitted to #{action} #{record}, but is permitted"
  end

  def permit(account, record, action)
    Pundit.authorize(account, record, action)
  rescue Pundit::NotAuthorizedError
    false
  end
end
