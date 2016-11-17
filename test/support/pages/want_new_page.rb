# WantNewPage
#  - page object to act as abstraction away from Capybara
#
class WantNewPage < BasePage
  def initialize(page)
    super(page, expected_title: 'Create Want')
  end

  def want
    click_on('Create Want')
    self
  end
end
