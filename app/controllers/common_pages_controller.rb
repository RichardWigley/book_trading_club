# CommonPagesController
#   - responsible for the routinely common pages of the website
#   - routine pages include: home, about, contact
#
class CommonPagesController < ApplicationController
  layout 'common_pages'

  def home
    @books = Book.limit(10).ordered
  end
end
