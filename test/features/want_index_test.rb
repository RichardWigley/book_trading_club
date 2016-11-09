require 'test_helper'

class WantIndexTest < Capybara::Rails::TestCase
  test "greets visitor with action to perform" do
    create_account_and_login
    click_on('Want', match: :first)

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Enter a search and the results appear here')
  end
end
