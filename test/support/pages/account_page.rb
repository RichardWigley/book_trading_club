require_relative 'base_page'

# AccountPage
#  - page object to act as abstraction away from Capybara
#
class AccountPage < BasePage
  def initialize(page)
    super(page, expected_title: 'Account')
  end

  def visit_contact(full_name:)
    click_on(full_name)
    self
  end

  def logout
    click_on 'Log out'
  end
end
