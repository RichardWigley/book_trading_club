# OfferShowPage
#  - page object to act as abstraction away from Capybara
#
class OfferShowPage < BasePage
  def initialize(page)
    super(page, expected_title: 'Show Offer')
  end

  def withdraw
    click_on('Withdraw Offer')
    self
  end
end
