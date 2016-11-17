require 'test_helper'

class WantSearchTest < Capybara::Rails::TestCase
  test "returns books in the library" do
    create_account_and_login
    Book.create(title: 'Emma', author: 'Jane Austin')
    ApplicationLayout.new.visit_want

    WantsPage.new(page).query('Aust').submit

    page.must_have_content('Jane Austin')
  end

  test "if no search term it gives user the appropriate action" do
    create_account_and_login
    Book.create(title: 'Emma', author: 'Jane Austin')
    ApplicationLayout.new.visit_want

    WantsPage.new(page).query('').submit

    page.must_have_content('There are no books containing the term(s) "".' \
                           ' Enter another search.')
  end

  test "returns nothing if book not in library" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login

    ApplicationLayout.new.visit_want

    WantsPage.new(page).query('Hobbit').submit

    page.must_have_content('There are no books containing the term(s) "Hobbit"')
  end
end
