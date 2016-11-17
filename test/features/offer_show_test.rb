require 'test_helper'

class OfferShowTest < Capybara::Rails::TestCase
  test "displays any offered books" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    account = create_account_and_login
    Offer.create(book: book, account: account)
    Menu.new.visit_offer
    assert_equal('Offer - BookTradingClub', page.title)

    page.must_have_content('Emma')
  end

  test "it can withdraw an offer" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    account = create_account_and_login
    Offer.create(book: book, account: account)
    Menu.new.visit_offer
    assert_equal('Offer - BookTradingClub', page.title)
    click_on('Emma')
    assert_equal('Show Offer - BookTradingClub', page.title)

    click_on('Withdraw Offer')

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Offer withdrawn for Emma')
  end
end
