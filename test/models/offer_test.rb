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
  include Factory
  test "#account_already_wants_book - valid if we do not want the book" do
    offer = account_create.offers.build(book: book)

    assert offer.valid?, 'Must be valid if we do not want the book'
  end

  test "#account_already_wants_book - invalid if we already want the book" do
    account = account_create
    account.wants.create(book: book)

    offer = account.offers.build(book: book)

    refute offer.valid?, 'Must be invalid if we already want the book'
    assert_includes offer.errors[:already_want_the_book], "- You cannot offer a book that you want.",
                    'Must be invalid for already wanting the book'
  end

  test "#close? true when there is a likely trade available" do
    offer = account_create.offers.build(book: book)
    want = account_create.wants.build(book: book)
    offer.trade = Trade.new(offer: offer, want: want)

    assert offer.close?, 'Offer with trade is closable'
  end

  test "#close? false when there is no likely trade available" do
    offer = account_create.offers.build(book: book)

    refute offer.close?, 'Offer without trade is not closeable'
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

  def book
    @book ||= Book.create(title: 'Emma', author: 'Jane Austin')
  end
end
