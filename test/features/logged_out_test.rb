require 'test_helper'

# Logged Out
#  - logged out user features
#
class LoggedOutTest < Capybara::Rails::TestCase
  test "user can navigate to log in" do
    visit logged_out_path

    CommonPagesLayout.new.login

    assert_equal('Log In - BookTradingClub', page.title)
  end

  test "user can navigate to sign up" do
    visit logged_out_path

    CommonPagesLayout.new.sign_up

    assert_equal('Sign Up - BookTradingClub', page.title)
  end
end
