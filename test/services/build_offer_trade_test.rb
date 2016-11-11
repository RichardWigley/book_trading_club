require 'test_helper'

class BuildOfferTradeTest < ActiveSupport::TestCase
  test 'builds a trade when book also wanted' do
    book = Book.new(title: 'Emma', author: 'Jane Austin')
    offer_account = account_create(email: 'offering@example.com')
    offer = Offer.new(account: offer_account, book: book)

    want_account = account_create(email: 'wanting@example.com')
    Want.create(account: want_account, book: book)

    @offer = BuildOfferTrade.new(offer: offer).build
    assert @offer.valid?
    assert_not_nil @offer.trade
  end

  test 'trade not built when book not wanted' do
    book = Book.new(title: 'Emma', author: 'Jane Austin')
    offer_account = account_create(email: 'offering@example.com')
    offer = Offer.new(account: offer_account, book: book)

    @offer = BuildOfferTrade.new(offer: offer).build
    assert @offer.valid?
    assert_nil @offer.trade
  end

  def account_create(email: 'user@example.com', password: 'password')
    Account.create(email: email, password: password, password_confirmation: password)
  end
end
