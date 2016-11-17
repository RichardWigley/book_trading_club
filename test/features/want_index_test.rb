require 'test_helper'

class WantIndexTest < Capybara::Rails::TestCase
  test "greets visitor with action to perform" do
    create_account_and_login
    ApplicationLayout.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Enter a search and the results appear here')
  end

  test "displays any wanted books" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login.wants.create(book: book)
    ApplicationLayout.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Emma')
  end

  test "displays information message if nothing wanted" do
    create_account_and_login

    ApplicationLayout.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Books you have already wanted will appear here.')
  end

  test "it can withdraw a wanted" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login.wants.create(book: book)

    ApplicationLayout.new.visit_want
    WantsPage.new(page).select('Emma')

    WantShowPage.new(page).withdraw

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Want withdrawn for Emma')
  end
end
