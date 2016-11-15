require 'test_helper'

# ContactEditTest
#  - account's contact information
#
class ContactEditTest < Capybara::Rails::TestCase
  # success

  test "can edit contact information" do
    create_account_and_login(email: 'user@example.com')

    click_on('Account', match: :first)
    assert_equal('Account - BookTradingClub', page.title)

    click_on('user@example.com')
    assert_equal('Edit Contact - BookTradingClub', page.title)

    click_on('Save and Continue')
    assert_equal('Account - BookTradingClub', page.title)
  end
end
