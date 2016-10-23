require 'test_helper'

# Account
#  - user's account information
#
class AccountShowTest < Capybara::Rails::TestCase
  # success

  test "can display account" do
    Account.create(email: 'user@example.com', password: 'secret')
    visit root_path
    click_on 'Log in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'

    click_on 'Account'
    assert_equal('Account - BookTradingClub', page.title)
  end

  test "can log out account" do
    Account.create(email: 'user@example.com', password: 'secret')
    visit root_path
    click_on 'Log in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'

    click_on 'Account'
    click_on 'Log out'

    assert_equal('Log Out - BookTradingClub', page.title)
  end
end
