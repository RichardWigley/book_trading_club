require 'test_helper'

class ContactPolicyTest < ActiveSupport::TestCase
  include Authorize

  test "Users can be edit their contact" do
    assert_permit(Account.new, :contact, :edit?)
  end

  test "Users can be update their contact" do
    assert_permit(Account.new, :contact, :update?)
  end
end
