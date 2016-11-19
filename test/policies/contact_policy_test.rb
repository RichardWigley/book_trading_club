require 'test_helper'

class ContactPolicyTest < ActiveSupport::TestCase
  include Authorize, Factory

  [:edit?, :update?].each do |method_name|
    test "##{method_name} - users can #{method_name} own contact" do
      account = account_create

      assert_permit(account, account.contact, method_name)
    end

    test "##{method_name} - users can not #{method_name} another contact" do
      account = account_create(email: 'user@example.com')
      other_account = account_create(email: 'other@example.com')

      refute_permit(other_account, account.contact, method_name)
    end
  end
end
