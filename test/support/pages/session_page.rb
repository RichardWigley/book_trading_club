# SessionPage
#  - page object to act as abstraction away from Capybara
#
class SessionPage < BasePage
  def initialize(page)
    super(page, expected_title: 'Log In')
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
end
