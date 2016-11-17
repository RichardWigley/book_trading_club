require 'test_helper'

class OfferIndexTest < Capybara::Rails::TestCase
  test "greets visitor with action to perform" do
    create_account_and_login
    ApplicationLayout.new.visit_offer
    assert_equal('Offer - BookTradingClub', page.title)

    page.must_have_content('Enter a search and the results appear here')
  end

  test "displays any offered books" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login.offers.create(book: book)
    ApplicationLayout.new.visit_offer

    page.must_have_content('Emma')
  end

  test "reminds account when they are not offering any books" do
    create_account_and_login
    ApplicationLayout.new.visit_offer

    page.must_have_content('You are not offering any books.')
  end

  test "it can withdraw an offer" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login.offers.create(book: book)

    ApplicationLayout.new.visit_offer
    OffersPage.new(page).select('Emma')

    OfferShowPage.new(page).withdraw

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Offer withdrawn for Emma')
  end
end
