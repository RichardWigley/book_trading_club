require 'test_helper'

class WantNewTest < Capybara::Rails::TestCase
  test "can make a want" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login

    click_on('Want', match: :first)
    assert_equal('Want - BookTradingClub', page.title)

    fill_in 'search', with: 'Emma'
    click_on 'Search'

    click_on('Emma')

    assert_equal('Create Want - BookTradingClub', page.title)
    click_on('Create Want')

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Emma, is now wanted')
  end

  test "errors are displayed" do
    account = create_account_and_login
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    Offer.create(book: book, account: account)

    click_on('Want', match: :first)
    assert_equal('Want - BookTradingClub', page.title)

    fill_in 'search', with: 'Emma'
    click_on 'Search'

    click_on('Emma')

    assert_equal('Create Want - BookTradingClub', page.title)
    click_on('Create Want')

    page.must_have_content('error prevented the form from being saved')
    page.must_have_content('Already offers the book')
  end
end
