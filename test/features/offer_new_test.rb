require "test_helper"

class OfferNewTest < Capybara::Rails::TestCase
  test "can make an offer" do
    Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    create_account_and_login

    click_on('Offer', match: :first)
    assert_equal('Offer - BookTradingClub', page.title)

    click_on('Vanity Fair')

    assert_equal('Make Offer - BookTradingClub', page.title)
    click_on('Make Offer')

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Vanity Fair, has been offered')
  end
end
