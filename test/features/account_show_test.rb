require 'test_helper'

# Account
#  - user's account information
#
class AccountShowTest < Capybara::Rails::TestCase
  # success

  test "can display account" do
    create_account_and_login

    Menu.new.visit_account
    assert_equal('Account - BookTradingClub', page.title)
  end

  test "can log out account" do
    create_account_and_login

    Menu.new.visit_account
    click_on 'Log out'

    assert_equal('Log Out - BookTradingClub', page.title)
    page.must_have_content('Signed out successfully')
  end

  test "displays if no trades have occurred" do
    create_account_and_login
    Menu.new.visit_account

    page.must_have_content('You have not made a trade. ' \
                           'When completed agreed trades will appear here.')
  end
end
