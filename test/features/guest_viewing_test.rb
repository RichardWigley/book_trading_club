require "test_helper"

# GuestViewing
#  - Guest user features
#
class GuestViewingTest < Capybara::Rails::TestCase
  test "can view landing page" do
    visit root_path
    assert_selector "h1", text: "ROE"
  end

  test "a guest can sign up" do
    visit root_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    click_on 'Sign up'
    page.must_have_content('Welcome! You have signed up successfully.')
  end
end
