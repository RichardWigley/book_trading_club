# CompleteContactPage
#  - page object to act as abstraction away from Capybara
#
class CompleteContactPage < BasePage
  def initialize(page)
    super(page, expected_title: 'Complete Contact')
  end

  def complete
    click_on('Complete Contact Form')
    self
  end
end
