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

  test ".untraded scope returns offers without trades" do
    offer = account_create(email: 'offer@example.com').offers.create(book: book)

    assert_includes Offer.untraded.to_a, offer
  end

  test ".untraded scope does not return offers with trades" do
    offer = account_create(email: 'offer@example.com').offers.create(book: book)
    want = account_create(email: 'want@example.com').wants.create(book: book)
    Trade.create(offer: offer, want: want)

    assert Offer.untraded.to_a.empty?
  end

  def account_create(email: 'user@example.com', password: 'password')
    Account.find_or_create_by(email: email) do |acc|
      acc.password = password
      acc.password_confirmation = password
    end
  end

  def book
    @book ||= Book.create(title: 'Emma', author: 'Jane Austin')
  end
end
