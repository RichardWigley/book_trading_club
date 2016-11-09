require 'test_helper'

class WantShowTest < Capybara::Rails::TestCase
  test "displays any wanted books" do
    account = create_account_and_login
    book = Book.create(title: 'Vanity Fair', author: 'William Makepeace Thackeray')
    Want.create(book_id: book.id, account_id: account.id)
    click_on('Want', match: :first)

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Vanity Fair')
  end
end
