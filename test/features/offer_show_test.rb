require 'test_helper'

class OfferShowTest < Capybara::Rails::TestCase
  test "displays any offered books" do
    account = create_account_and_login
    book = Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    Offer.create(book_id: book.id, account_id: account.id)
    click_on('Offer', match: :first)

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Vanity Fair')
  end

  test "it can withdraw an offer" do
    account = create_account_and_login
    book = Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    Offer.create(book_id: book.id, account_id: account.id)
    click_on('Offer', match: :first)

    assert_equal('Offer - BookTradingClub', page.title)
    click_on('Vanity Fair')

    assert_equal('Show Offer - BookTradingClub', page.title)
    click_on('Withdraw Offer')

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Offer withdrawn for Vanity Fair')
  end
end
