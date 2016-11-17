# WantShowPage
#  - page object to act as abstraction away from Capybara
#
class WantShowPage < BasePage
  def initialize(page)
    super(page, expected_title: 'Show Want')
  end

  def withdraw
    click_on('Withdraw Want')
    self
  end
end
