# Search
#  - 'page' object to abstract the search component
#    - used in Want and Offer
#
class Search
  include Capybara::DSL

  def query(text)
    fill_in 'search', with: text
    self
  end

  def submit
    click_on 'Search'
    self
  end
end
