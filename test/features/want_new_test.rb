require 'test_helper'

class WantNewTest < Capybara::Rails::TestCase
  test "can make a want" do
    Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    create_account_and_login

    click_on('Want', match: :first)
    assert_equal('Want - BookTradingClub', page.title)

    fill_in 'search', with: 'Vanity Fair'
    click_on 'Search'

    click_on('Vanity Fair')

    assert_equal('Create Want - BookTradingClub', page.title)
    click_on('Create Want')

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Vanity Fair, is now wanted')
  end

  test "errors are displayed" do
    account = create_account_and_login
    book = Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    Offer.create(book_id: book.id, account_id: account.id)

    click_on('Want', match: :first)
    assert_equal('Want - BookTradingClub', page.title)

    fill_in 'search', with: 'Vanity Fair'
    click_on 'Search'

    click_on('Vanity Fair')

    assert_equal('Create Want - BookTradingClub', page.title)
    click_on('Create Want')

    page.must_have_content('error prevented the form from being saved')
    page.must_have_content('Already offers the book')
  end
end
