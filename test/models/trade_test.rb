# == Schema Information
#
# Table name: trades
#
#  id         :integer          not null, primary key
#  offer_id   :integer          not null
#  want_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class TradeTest < ActiveSupport::TestCase
  def setup
    book = Book.new(title: 'Emma', author: 'Jane Austin')
    offer = account_create(email: 'offering@example.com').offers.create(book: book)
    want = account_create(email: 'wanting@example.com').wants.create(book: book)
    @trade = Trade.new(offer: offer, want: want)
  end

  test "is valid trade " do
    assert @trade.valid?
  end

  test "is invalid without offer" do
    @trade.offer = nil

    refute @trade.valid?
    assert_not_nil @trade.errors[:offer], 'no validation error for offer present'
  end

  test "is invalid without wants" do
    @trade.want = nil

    refute @trade.valid?
    assert_not_nil @trade.errors[:want], 'no validation error for want present'
  end

  def account_create(email: 'user@example.com', password: 'password')
    Account.find_or_create_by(email: email) do |acc|
      acc.password = password
      acc.password_confirmation = password
    end
  end
end
