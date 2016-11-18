require 'test_helper'

class WantNewTest < Capybara::Rails::TestCase
  include Factory
  test "can make a want" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_with_contact_and_login(page)
    ApplicationLayout.new.visit_want
    WantsPage.new(page).query('Emma').submit.select('Emma')

    WantNewPage.new(page).want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Emma, is now wanted')
  end

  test "when book on offer it tells accounts that want it that it is available" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    account_create(email: 'offerer@example.com').offers.create(book: book)
    create_account_with_contact_and_login(page)
    ApplicationLayout.new.visit_want

    WantsPage.new(page).query('Emma').submit.select('Emma')

    page.must_have_content('Book is available')
  end

  test "can tell user the book is not available" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_with_contact_and_login(page)
    ApplicationLayout.new.visit_want

    WantsPage.new(page).query('Emma').submit.select('Emma')

    page.must_have_content('There is a wait')
  end

  test "redirects to complete profile" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login
    ApplicationLayout.new.visit_want
    WantsPage.new(page).query('Emma').submit.select('Emma')

    CompleteContactPage.new(page).complete
    ContactPage.new(page).fill(full_name: 'Bo',
                               address_line_1: '8 Station Road',
                               town: 'Fareham').save
    WantNewPage.new(page).want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Emma, is now wanted')
  end

  test "errors are displayed" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_with_contact_and_login(page).offers.create(book: book)
    ApplicationLayout.new.visit_want
    WantsPage.new(page).query('Emma').submit.select('Emma')

    WantNewPage.new(page).want

    page.must_have_content('error prevented the form from being saved')
  end
end
