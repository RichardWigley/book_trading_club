require 'test_helper'

class BuildOfferTradeTest < ActiveSupport::TestCase
  include Factory
  test 'builds a trade when book also wanted' do
    offer = account_create(email: 'offering@example.com').offers.build(book: book)
    account_create(email: 'wanting@example.com').wants.create(book: book)

    @offer = BuildOfferTrade.new(offer: offer).build.offer

    assert @offer.valid?
    assert_not_nil @offer.trade
  end

  test 'trade not built when book not wanted' do
    offer = account_create(email: 'offering@example.com').offers.build(book: book)

    @offer = BuildOfferTrade.new(offer: offer).build.offer

    assert @offer.valid?
    assert_nil @offer.trade
  end

  def book
    @book ||= Book.create(title: 'Emma', author: 'Jane Austin')
  end
end
