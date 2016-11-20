require 'test_helper'

class TradePolicyTest < ActiveSupport::TestCase
  include Authorize

  test "Users can list trades" do
    assert_permit(Account.new, :trade, :index?)
  end
end
