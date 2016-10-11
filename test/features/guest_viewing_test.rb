require "test_helper"

# GuestViewing
#  - Guest user features
#
class GuestViewingTest < Capybara::Rails::TestCase
  test "can view landing page" do
    visit root_path
    assert_selector "h1", text: "ROE"
  end
end
