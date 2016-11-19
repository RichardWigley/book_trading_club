require 'test_helper'

class AccountPolicyTest < ActiveSupport::TestCase
  include Authorize, Factory

  [:show?].each do |method_name|
    test "##{method_name} - users can have own account" do
      account = account_create

      assert_permit(account, account, method_name)
    end

    test "##{method_name} - users can not have another account" do
      account = account_create(email: 'user@example.com')
      other_account = account_create(email: 'other@example.com')

      refute_permit(other_account, account, method_name)
    end
  end
end
