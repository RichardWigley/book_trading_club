# Application Policy
#  - base policy for application
#
class ApplicationPolicy
  attr_reader :account, :resource

  def initialize(account, resource)
    @account = account
    @resource = resource
  end
end
