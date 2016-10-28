# BooksController
#  - the glue for book request / responses
#
class BooksController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def index
    search = params[:search]
    @books = Book.where(nil)
    @books = Book.search_for(search) if search.present?
    authorize Book
  end
end
