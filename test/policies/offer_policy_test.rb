require 'test_helper'

class OfferPolicyTest < ActiveSupport::TestCase
  include Authorize, Factory
  test "users can list offers" do
    assert_permit(Account.new, :offer, :index?)
  end

  [:new?, :create?, :show?, :destroy?].each do |method_name|
    test "##{method_name} - users can have #{method_name} offer" do
      account = account_create
      offer = account.offers.build(book: Book.new)

      assert_permit(account, offer, method_name)
    end

    test "##{method_name} - users can not have another's #{method_name} offer" do
      account = account_create(email: 'user@example.com')
      other_account = account_create(email: 'other@example.com')
      offer = account.offers.build(book: Book.new)

      refute_permit(other_account, offer, method_name)
    end
  end
end
