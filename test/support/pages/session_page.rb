# SessionPage
#  - page object to act as abstraction away from Capybara
#
class SessionPage
  include Capybara::DSL
  EXPECTED_PAGE = 'Log In - BookTradingClub'.freeze

  def initialize(page)
    @page = page
    raise ArgumentError, error_message if EXPECTED_PAGE != page.title
  end

  def fill(email: 'user@example.com', password: 'secret')
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    self
  end

  def login
    click_on('Log in')
    self
  end

  private

  def error_message
    "#{self.class} is expected to be used on '#{EXPECTED_PAGE}' " \
      "but is actually being used on '#{page.title}'"
  end
end
