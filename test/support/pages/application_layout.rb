# ApplicationLayout
#  - page object to act as abstraction away from Capybara
#
class ApplicationLayout
  include Capybara::DSL

  def visit_account
    click_on('Account', match: :first)
    self
  end

  def visit_logo
    click_on 'ROE'
    self
  end

  def visit_offer
    click_on('Offer', match: :first)
    self
  end

  def visit_trades
    click_on('Trades', match: :first)
    self
  end

  def visit_want
    click_on('Want', match: :first)
    self
  end
end
