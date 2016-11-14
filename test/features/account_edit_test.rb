require 'test_helper'

# Account
#  - user's account information
#
class AccountEditTest < Capybara::Rails::TestCase
  # success

  test "can edit account" do
    create_account_and_login(email: 'user@example.com')

    click_on('Account', match: :first)
    assert_equal('Account - BookTradingClub', page.title)

    click_on('user@example.com')
    assert_equal('Edit Account - BookTradingClub', page.title)

    click_on('Save and Continue')
    assert_equal('Account - BookTradingClub', page.title)
  end
end
