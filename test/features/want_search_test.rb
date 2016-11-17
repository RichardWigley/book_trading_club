require 'test_helper'

class WantSearchTest < Capybara::Rails::TestCase
  test "returns books in the library" do
    create_account_and_login
    Book.create(title: 'Emma', author: 'Jane Austin')
    Menu.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    Search.new.query('Aust').submit

    page.must_have_content('Jane Austin')
  end

  test "if no search term it gives user the appropriate action" do
    create_account_and_login
    Book.create(title: 'Emma', author: 'Jane Austin')
    Menu.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    Search.new.query('').submit

    page.must_have_content('There are no books containing the term(s) "".' \
                           ' Enter another search.')
  end

  test "returns nothing if book not in library" do
    create_account_and_login
    Book.create(title: 'Emma', author: 'Jane Austin')
    Menu.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    Search.new.query('Hobbit').submit

    page.must_have_content('There are no books containing the term(s) "Hobbit"')
  end
end
