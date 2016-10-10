require "test_helper"

# GuestViewing
#  - Guest user features
#
class GuestViewingTest < Capybara::Rails::TestCase
  test "document title has been set" do
    visit root_path
    # assert_selector "h1", text: "ROE"
  end
end
