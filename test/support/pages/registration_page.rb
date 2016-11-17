# RegistrationPage
#  - page object to act as abstraction away from Capybara
#
class RegistrationPage < BasePage
  def initialize(page)
    super(page, expected_title: 'Sign Up')
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
end
