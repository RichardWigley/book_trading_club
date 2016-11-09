# WantsController
#   - allowing accounts to want books
#
class WantsController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def index
    search = params[:search]
    @books_search = Book.none
    @books_search = Book.search_for(search) if search.present?
    authorize Want
  end
end
