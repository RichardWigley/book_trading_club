# == Schema Information
#
# Table name: accounts
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

# AccountTest
#  - unit testing Account
#
class AccountTest < ActiveSupport::TestCase
  def setup
    @account ||= Account.new(email: 'user@example.com',
                             password: 'password',
                             password_confirmation: 'password')
  end

  test "valid" do
    assert @account.valid?
  end

  test "responds_to completd?" do
    assert_respond_to(@account, :completed?, 'must respond to completed?')
  end
end
