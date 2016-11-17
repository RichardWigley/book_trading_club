# OffersPage
#  - page object to act as abstraction away from Capybara
#
class OffersPage
  extend Forwardable
  include Capybara::DSL
  EXPECTED_PAGE = 'Offer - BookTradingClub'.freeze
  attr_reader :page

  def initialize(page)
    @page = page
    raise ArgumentError, error_message if EXPECTED_PAGE != page.title
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

  private

  def error_message
    "#{self.class} is expected to be used on '#{EXPECTED_PAGE}' " \
      "but is actually being used on '#{page.title}'"
  end
end
