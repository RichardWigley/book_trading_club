# WantNewPage
#  - page object to act as abstraction away from Capybara
#
class WantNewPage
  include Capybara::DSL
  EXPECTED_PAGE = 'Create Want - BookTradingClub'.freeze

  def initialize(page)
    @page = page
    raise ArgumentError, error_message if EXPECTED_PAGE != page.title
  end

  def want
    click_on('Create Want')
    self
  end

  private

  def error_message
    "#{self.class} is expected to be used on '#{EXPECTED_PAGE}' " \
      "but is actually being used on '#{page.title}'"
  end
end