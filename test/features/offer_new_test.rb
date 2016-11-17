require "test_helper"

class OfferNewTest < Capybara::Rails::TestCase
  test "can make an offer" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login

    Menu.new.visit_offer
    OffersPage.new(page).query('Emma').submit.select('Emma')

    assert_equal('Make Offer - BookTradingClub', page.title)
    click_on('Make Offer')

    assert_equal('Offer - BookTradingClub', page.title)
    page.must_have_content('Emma, has been offered')
  end

  test "errors are displayed" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login.wants.create(book: book)
    Menu.new.visit_offer
    OffersPage.new(page).query('Emma').submit.select('Emma')

    assert_equal('Make Offer - BookTradingClub', page.title)
    click_on('Make Offer')

    page.must_have_content('error prevented the form from being saved')
    page.must_have_content('Already want the book')
  end
end
