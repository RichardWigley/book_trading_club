# StaticApplicationLayout
#  - page object to act as abstraction away from Capybara
#
class CommonPagesLayout
  include Capybara::DSL

  def login
    click_on('Log in')
    self
  end

  def sign_up
    click_on('Sign up')
    self
  end
end
