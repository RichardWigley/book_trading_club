# RegistrationPage
#  - page object to act as abstraction away from Capybara
#
class RegistrationPage
  include Capybara::DSL
  EXPECTED_PAGE = 'Sign Up - BookTradingClub'.freeze

  def initialize(page)
    @page = page
    raise ArgumentError, error_message if EXPECTED_PAGE != page.title
  end

  def fill(email: 'user@example.com', password: 'secret', confirm: 'secret')
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: confirm
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
