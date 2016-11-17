# WantsPage
#  - page object to act as abstraction away from Capybara
#
class WantsPage < BasePage
  def initialize(page)
    super(page, expected_title: 'Want')
  end

  def query(text)
    fill_in 'search', with: text
    self
  end

  def submit
    click_on 'Search'
    self
  end

  def select(text)
    click_on(text)
    self
  end
end
