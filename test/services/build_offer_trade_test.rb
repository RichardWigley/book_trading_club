require 'test_helper'

class BuildOfferTradeTest < ActiveSupport::TestCase
  test 'builds a trade when book also wanted' do
    offer = account_create(email: 'offering@example.com').offers.build(book: book)
    account_create(email: 'wanting@example.com').wants.create(book: book)

    @offer = BuildOfferTrade.new(offer: offer).build

    assert @offer.valid?
    assert_not_nil @offer.trade
  end

  test 'trade not built when book not wanted' do
    offer = account_create(email: 'offering@example.com').offers.build(book: book)

    @offer = BuildOfferTrade.new(offer: offer).build

    assert @offer.valid?
    assert_nil @offer.trade
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
