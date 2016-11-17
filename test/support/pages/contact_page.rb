# ContactPage
#  - page object to act as abstraction away from Capybara
#
class ContactPage
  include Capybara::DSL
  EXPECTED_PAGE = 'Edit Contact - BookTradingClub'.freeze

  def initialize(page)
    @page = page
    raise ArgumentError, error_message if EXPECTED_PAGE != page.title
  end

  def fill(full_name: 'Bo',
           address_line_1: '8 Station Road',
           address_line_2: 'Wickham',
           town: 'Fareham',
           county: 'Kent',
           postcode: 'BR4 0PU')
    fill_in 'Full name', with: full_name
    fill_in 'Address line 1', with: address_line_1
    fill_in 'Address line 2', with: address_line_2
    fill_in 'Town', with: town
    fill_in 'County', with: county
    fill_in 'Postcode', with: postcode
    self
  end

  def save
    click_on('Save and Continue')
    self
  end

  private

  def error_message
    "ContactPage is expected to be used on '#{EXPECTED_PAGE}' " \
      "but is actually being used on '#{page.title}'"
  end
end
