# BasePage
#  - page object to act as abstraction away from Capybara
#
class BasePage
  include Capybara::DSL
  attr_reader :page, :expected_page

  def initialize(page, expected_title:)
    @page = page
    @expected_page = "#{expected_title} - BookTradingClub"
    raise ArgumentError, error_message if expected_page != page.title
  end

  private

  def error_message
    "#{self.class} is expected to be used on '#{expected_page}' " \
      "but is actually being used on '#{page.title}'"
  end
end
