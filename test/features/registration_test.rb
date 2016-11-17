require "test_helper"

# Registration
#  - Registration feature
#
class RegistrationTest < Capybara::Rails::TestCase
  test "can view landing page" do
    visit root_path
    assert_selector "h1", text: "ROE"
  end

  # success

  test "a guest can sign up" do
    visit root_path
    click_on 'Sign up'

    RegistrationPage.new(page).fill(email: 'user@example.com',
                                    password: 'secret',
                                    confirm: 'secret').sign_up

    assert_equal('Library - BookTradingClub', page.title)
    page.must_have_content('Welcome! You have signed up successfully.')
  end

  # failure

  test "a guest cannot sign up without valid information" do
    visit root_path
    click_on 'Sign up'

    RegistrationPage.new(page).fill(email: 'user@example.com',
                                    password: '',
                                    confirm: 'secret').sign_up

    assert_equal('Sign Up - BookTradingClub', page.title)
    page.must_have_content('errors prohibited this account from being saved')
  end
end
