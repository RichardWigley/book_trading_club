# DeviseHelper
#  - methods required by devise if you are using a form outside of a devise controller
#
module AuthenticationHelper
  def resource_name
    :account
  end

  def resource
    @resource ||= Account.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:account]
  end
end
