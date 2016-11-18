# BuildTradeWant
#  - build a trade object starting with want and a book
#
class BuildWantTrade
  attr_accessor :trade, :want

  def initialize(want:)
    self.want = want
    self.trade = Trade.new
  end

  def build
    if offer.present?
      trade.want = want
      trade.offer = offer.first
    end
    want
  end

  private

  def offer
    @offer ||= Offer.untraded.by_book(want.book)
  end
end
