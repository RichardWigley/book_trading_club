# == Schema Information
#
# Table name: offers
#
#  id         :integer          not null, primary key
#  account_id :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class OfferTest < ActiveSupport::TestCase
  test "valid if we do not want the book" do
    offer = account_create.offers.build(book: book)

    assert offer.valid?, 'Must be valid if we do not want the book'
  end

  test "invalid if we already want the book" do
    account = account_create
    account.wants.create(book: book)
    offer = account.offers.build(book: book)

    refute offer.valid?, 'Must be invalid if we already want the book'
    assert_includes offer.errors[:already_want_the_book], "- You cannot offer a book that you want.",
                    'Must be invalid for already wanting the book'
  end

  def account_create(email: 'user@example.com', password: 'password')
    Account.create(email: email, password: password, password_confirmation: password)
  end

  def book
    @book ||= Book.create(title: 'Emma', author: 'Jane Austin')
  end
end
