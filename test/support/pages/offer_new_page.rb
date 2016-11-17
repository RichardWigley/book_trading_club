# OfferNewPage
#  - page object to act as abstraction away from Capybara
#
class OfferNewPage < BasePage
  def initialize(page)
    super(page, expected_title: 'Make Offer')
  end

  def offer
    click_on('Make Offer')
    self
  end
end
