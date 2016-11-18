require "test_helper"

class OfferNewTest < Capybara::Rails::TestCase
  include Factory
  test "can make an offer" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login
    ApplicationLayout.new.visit_offer
    OffersPage.new(page).query('Emma').submit.select('Emma')

    OfferNewPage.new(page).offer

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Emma, has been offered')
  end

  test "when a book is wanted the account could expect the trade to happen quickly" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    account_create(email: 'wanter@example.com').wants.create(book: book)
    create_account_with_contact_and_login(page)
    ApplicationLayout.new.visit_offer

    OffersPage.new(page).query('Emma').submit.select('Emma')

    page.must_have_content('Book is available')
  end

  test "can tell user the book is not available" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_with_contact_and_login(page)
    ApplicationLayout.new.visit_offer

    OffersPage.new(page).query('Emma').submit.select('Emma')

    page.must_have_content('There is a wait')
  end

  test "errors are displayed" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login.wants.create(book: book)
    ApplicationLayout.new.visit_offer
    OffersPage.new(page).query('Emma').submit.select('Emma')

    OfferNewPage.new(page).offer

    page.must_have_content('error prevented the form from being saved')
  end
end
