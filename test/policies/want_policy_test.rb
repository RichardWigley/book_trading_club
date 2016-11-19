require 'test_helper'

class WantPolicyTest < ActiveSupport::TestCase
  include Authorize, Factory
  test "users can list wants" do
    assert_permit(Account.new, :want, :index?)
  end

  [:new?, :create?, :show?, :destroy?].each do |method_name|
    test "##{method_name} - users can have #{method_name} want" do
      account = account_create
      want = account.wants.build(book: Book.new)

      assert_permit(account, want, method_name)
    end

    test "##{method_name} - users can not have another #{method_name} want" do
      account = account_create(email: 'user@example.com')
      other_account = account_create(email: 'other@example.com')
      want = account.wants.build(book: Book.new)

      refute_permit(other_account, want, method_name)
    end
  end
end
