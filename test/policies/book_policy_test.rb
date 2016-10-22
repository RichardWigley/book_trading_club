require 'test_helper'

class BookPolicyTest < ActiveSupport::TestCase
  include Authorize

  test "Users can list books" do
    assert_permit(Account.new, :book, :index?)
  end
end
