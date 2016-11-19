require 'test_helper'

# ContactEditTest
#  - account's contact information
#
class ContactEditTest < Capybara::Rails::TestCase
  test "can edit contact information" do
    create_account_and_login(email: 'user@example.com')
    ApplicationLayout.new.visit_account
    AccountPage.new(page).visit_contact(full_name: 'user@example.com')

    ContactPage.new(page).fill(full_name: 'Bo',
                               address_line_1: '8 Station Road',
                               address_line_2: 'Wickham',
                               town: 'Fareham',
                               county: 'Kent',
                               postcode: 'BR4 0PU').save

    assert_equal('Account - BookTradingClub', page.title)
    page.must_have_content("Bo\n8 Station Road\nWickham\nFareham\nKent\nBR4 0PU")
  end

  test "can return error message" do
    create_account_and_login(email: 'user@example.com')
    ApplicationLayout.new.visit_account
    AccountPage.new(page).visit_contact(full_name: 'user@example.com')

    ContactPage.new(page).fill(address_line_1: '',
                               county: 'Kent').save

    page.must_have_content('error prevented the form from being saved:')
  end
end
