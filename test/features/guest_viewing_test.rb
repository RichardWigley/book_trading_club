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
    skip('todo')
    visit root_path
  end
end
