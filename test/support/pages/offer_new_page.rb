# OfferNewPage
#  - page object to act as abstraction away from Capybara
#
class OfferNewPage
  include Capybara::DSL
  EXPECTED_PAGE = 'Make Offer - BookTradingClub'.freeze

  def initialize(page)
    @page = page
    raise ArgumentError, error_message if EXPECTED_PAGE != page.title
  end

  def offer
    click_on('Make Offer')
    self
  end

  private

  def error_message
    "#{self.class} is expected to be used on '#{EXPECTED_PAGE}' " \
      "but is actually being used on '#{page.title}'"
  end
end
