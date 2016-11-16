# Menu
#  - page object to act as abstraction away from Capybara
#
class Menu
  include Capybara::DSL

  def visit_account
    click_on('Account', match: :first)
    self
  end

  def visit_offer
    click_on('Offer', match: :first)
    self
  end

  def visit_want
    click_on('Want', match: :first)
    self
  end
end
