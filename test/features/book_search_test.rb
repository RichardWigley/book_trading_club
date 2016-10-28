require "test_helper"

class BookSearchTest < Capybara::Rails::TestCase
  test "returns books in the library" do
    Account.create(email: 'user@example.com', password: 'secret')
    Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    visit root_path
    click_on 'Log in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'

    assert_equal('Library - BookTradingClub', page.title)
    fill_in 'search', with: 'Tha'
    click_on 'Search'
    page.must_have_content('William Makepeace Thackeray')
  end

  test "returns all books in the library if no search term" do
    Account.create(email: 'user@example.com', password: 'secret')
    Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    visit root_path
    click_on 'Log in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'

    assert_equal('Library - BookTradingClub', page.title)
    fill_in 'search', with: ''
    click_on 'Search'
    page.must_have_content('William Makepeace Thackeray')
  end

  test "returns nothing if book not in library" do
    Account.create(email: 'user@example.com', password: 'secret')
    Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    visit root_path
    click_on 'Log in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'

    assert_equal('Library - BookTradingClub', page.title)
    fill_in 'search', with: 'Hobbit'
    click_on 'Search'
    page.must_have_content('There are no books containing the term(s) Hobbit')
  end
end
