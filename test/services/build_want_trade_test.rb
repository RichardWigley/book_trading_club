require 'test_helper'

class BuildWantTradeTest < ActiveSupport::TestCase
  include Factory
  test 'builds a trade when book also offered' do
    want = account_create(email: 'wanting@example.com').wants.build(book: book)
    account_create(email: 'offering@example.com').offers.create(book: book)

    @want = BuildWantTrade.new(want: want).build.want

    assert @want.valid?
    assert_not_nil @want.trade
  end

  test 'trade not built when book not offered' do
    want = account_create(email: 'wanting@example.com').wants.build(book: book)

    @want = BuildWantTrade.new(want: want).build.want

    assert @want.valid?
    assert_nil @want.trade
  end

  def book
    @book ||= Book.create(title: 'Emma', author: 'Jane Austin')
  end
end
