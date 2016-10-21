# BooksController
#  - the glue for book request / responses
#
class BooksController < ApplicationController
  def index
    @books = Book.all
  end
end
