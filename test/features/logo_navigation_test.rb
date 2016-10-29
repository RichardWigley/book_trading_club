require "test_helper"

class LogoNavigationTest < Capybara::Rails::TestCase
  test "without login - site logo navigates back to welcome" do
    visit new_account_session_path
    click_on 'ROE'

    assert_equal('Welcome - BookTradingClub', page.title)
  end

  test "with login - site logo navigates back to library" do
    create_account_and_login

    click_on('Account', match: :first)
    assert_equal('Account - BookTradingClub', page.title)

    click_on 'ROE'
    assert_equal('Library - BookTradingClub', page.title)
  end
end
