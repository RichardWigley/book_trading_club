require 'test_helper'

class WantNewTest < Capybara::Rails::TestCase
  test "can make a want" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_with_contact_and_login(page)
    ApplicationLayout.new.visit_want
    WantsPage.new(page).query('Emma').submit.select('Emma')

    WantNewPage.new(page).want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Emma, is now wanted')
  end

  test "redirects to complete profile" do
    Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_and_login
    ApplicationLayout.new.visit_want
    WantsPage.new(page).query('Emma').submit.select('Emma')

    assert_equal('Complete Contact - BookTradingClub', page.title)
    click_on('Complete Contact Form')

    ContactPage.new(page).fill(full_name: 'Bo',
                               address_line_1: '8 Station Road',
                               town: 'Fareham').save

    WantNewPage.new(page).want

    assert_equal('Want - BookTradingClub', page.title)
    page.must_have_content('Emma, is now wanted')
  end

  test "errors are displayed" do
    book = Book.create(title: 'Emma', author: 'Jane Austin')
    create_account_with_contact_and_login(page).offers.create(book: book)
    ApplicationLayout.new.visit_want
    WantsPage.new(page).query('Emma').submit.select('Emma')

    WantNewPage.new(page).want

    page.must_have_content('error prevented the form from being saved')
  end
end
