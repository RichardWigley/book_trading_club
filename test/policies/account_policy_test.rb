require 'test_helper'

class AccountPolicyTest < ActiveSupport::TestCase
  include Authorize

  test "Users can be shown their account" do
    assert_permit(Account.new, :account, :show?)
  end
end
