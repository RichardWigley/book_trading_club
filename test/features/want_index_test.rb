require 'test_helper'

class WantIndexTest < Capybara::Rails::TestCase
  test "greets visitor with action to perform" do
    create_account_and_login
    Menu.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Enter a search and the results appear here')
  end

  test "displays any wanted books" do
    account = create_account_and_login
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    Want.create(book: book, account: account)
    Menu.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Emma')
  end

  test "displays information message if nothing wanted" do
    create_account_and_login
    Menu.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Books you have already wanted will appear here.')
  end
end
