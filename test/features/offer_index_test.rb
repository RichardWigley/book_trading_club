require 'test_helper'

class OfferIndexTest < Capybara::Rails::TestCase
  test "greets visitor with action to perform" do
    create_account_and_login
    Menu.new.visit_offer

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Enter a search and the results appear here')
  end

  test "displays any offered books" do
    account = create_account_and_login
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    Offer.create(book: book, account: account)
    Menu.new.visit_offer

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Emma')
  end

  test "reminds account when they are not offering any books" do
    create_account_and_login
    Menu.new.visit_offer

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('You are not offering any books.')
  end
end
