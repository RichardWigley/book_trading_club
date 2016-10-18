require 'test_helper'

# Session
#  - user session feature
#
class SessionTest < Capybara::Rails::TestCase
  # success

  test "can log in" do
    Account.create(email: 'user@example.com', password: 'secret')
    visit root_path
    click_on 'Log In'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'
    page.must_have_content('Signed in successfully.')
  end

  # failure

  test "cannot log in without valid information" do
    visit root_path
    click_on 'Log In'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'
    page.must_have_content('Invalid Email or password.')
  end
end
