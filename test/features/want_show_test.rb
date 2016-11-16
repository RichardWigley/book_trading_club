require 'test_helper'

class WantShowTest < Capybara::Rails::TestCase
  test "displays any wanted books" do
    account = create_account_and_login
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    Want.create(book: book, account: account)
    Menu.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Emma')
  end

  test "it can withdraw a wanted" do
    account = create_account_and_login
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    Want.create(book: book, account: account)
    Menu.new.visit_want

    assert_equal('Want - BookTradingClub', page.title)
    click_on('Emma')

    assert_equal('Show Want - BookTradingClub', page.title)
    click_on('Withdraw Want')

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Want withdrawn for Emma')
  end
end
