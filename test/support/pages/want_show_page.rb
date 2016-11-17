# WantShowPage
#  - page object to act as abstraction away from Capybara
#
class WantShowPage
  extend Forwardable
  include Capybara::DSL
  EXPECTED_PAGE = 'Show Want - BookTradingClub'.freeze
  attr_reader :page

  def initialize(page)
    @page = page
    raise ArgumentError, error_message if EXPECTED_PAGE != page.title
  end

  def withdraw
    click_on('Withdraw Want')
    self
  end

  private

  def error_message
    "#{self.class} is expected to be used on '#{EXPECTED_PAGE}' " \
      "but is actually being used on '#{page.title}'"
  end
end
