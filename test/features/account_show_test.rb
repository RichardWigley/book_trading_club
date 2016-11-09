require 'test_helper'

# Account
#  - user's account information
#
class AccountShowTest < Capybara::Rails::TestCase
  # success

  test "can display account" do
    create_account_and_login

    click_on('Account', match: :first)
    assert_equal('Account - BookTradingClub', page.title)
  end

  test "can log out account" do
    create_account_and_login

    click_on('Account', match: :first)
    click_on 'Log out'

    assert_equal('Log Out - BookTradingClub', page.title)
    page.must_have_content('Signed out successfully')
  end
end
