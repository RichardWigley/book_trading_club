# LoggedOutPage
#  - page object to act as abstraction away from Capybara
#
class LoggedOutPage
  include Capybara::DSL
  EXPECTED_PAGE = 'Log Out - BookTradingClub'.freeze

  def initialize(page)
    @page = page
    raise ArgumentError, error_message if EXPECTED_PAGE != page.title
  end

  def login
    click_on('Log in')
    self
  end

  def sign_up
    click_on('Sign up')
    self
  end

  private

  def error_message
    "#{self.class} is expected to be used on '#{EXPECTED_PAGE}' " \
      "but is actually being used on '#{page.title}'"
  end
end
