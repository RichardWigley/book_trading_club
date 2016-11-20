require 'test_helper'

# Trade
#  - captures agreements between owners of books
#
class TradesIndexTest < Capybara::Rails::TestCase
  test "displays if no trades have occurred" do
    create_account_and_login
    ApplicationLayout.new.visit_trades

    page.must_have_content('You have not made a trade. ' \
                           'When completed agreed trades will appear here.')
  end
end
