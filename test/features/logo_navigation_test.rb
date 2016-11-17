require "test_helper"

class LogoNavigationTest < Capybara::Rails::TestCase
  test "without login - site logo navigates back to welcome" do
    visit new_account_session_path
    ApplicationLayout.new.visit_logo

    assert_equal('Welcome - BookTradingClub', page.title)
  end

  test "with login - site logo navigates back to library" do
    create_account_and_login

    ApplicationLayout.new.visit_account
    assert_equal('Account - BookTradingClub', page.title)

    ApplicationLayout.new.visit_logo
    assert_equal('Library - BookTradingClub', page.title)
  end
end
