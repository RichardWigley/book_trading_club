# == Schema Information
#
# Table name: wants
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class WantTest < ActiveSupport::TestCase
  test "valid if we do not offer the book" do
    want = account_create.wants.build(book: book)

    assert want.valid?, 'Must be valid if we do not already offer the book'
  end

  test "invalid if we already offer the book" do
    account = account_create
    account.offers.create(book: book)
    want = account.wants.build(book: book)

    refute want.valid?, 'Must be invalid if we alredy offer the book'
    assert_includes want.errors[:already_offers_the_book], "- You cannot want a book that you offer.",
                    'Must be invalid for already offering the book'
  end

  test ".untraded scope returns wants without trades" do
    offer = account_create(email: 'offer@example.com').wants.create(book: book)

    assert_includes Want.untraded.to_a, offer
  end

  test ".untraded scope does not return wants with trades" do
    offer = account_create(email: 'offer@example.com').offers.create(book: book)
    want = account_create(email: 'want@example.com').wants.create(book: book)
    Trade.create(offer: offer, want: want)

    assert Want.untraded.to_a.empty?
  end

  def account_create(email: 'user@example.com', password: 'password')
    Account.create(email: email, password: password, password_confirmation: password)
  end

  def book
    @book ||= Book.create(title: 'Emma', author: 'Jane Austin')
  end
end
