# AccountPage
#  - page object to act as abstraction away from Capybara
#
class AccountPage
  include Capybara::DSL
  EXPECTED_PAGE = 'Account - BookTradingClub'.freeze

  def initialize(page)
    @page = page
    raise ArgumentError, error_message if EXPECTED_PAGE != page.title
  end

  def visit_contact(full_name:)
    click_on(full_name)
    self
  end

  def logout
    click_on 'Log out'
  end

  private

  def error_message
    "#{self.class} is expected to be used on '#{EXPECTED_PAGE}' " \
      "but is actually being used on '#{page.title}'"
  end
end
