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
end