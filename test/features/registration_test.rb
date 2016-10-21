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
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    click_on 'Sign up'
    page.must_have_content('Welcome! You have signed up successfully.')
  end

  # failure

  test "a guest cannot sign up without valid information" do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: 'secret'
    click_on 'Sign up'

    assert_equal('Sign Up - BookTradingClub', page.title)
    page.must_have_content('errors prohibited this account from being saved')
  end
end
