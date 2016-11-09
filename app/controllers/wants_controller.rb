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

  def new
    @book = Book.find(params[:book_id])
    want = Want.new(account_id: current_account.id)
    authorize want
  end

  def create
    want = current_account.wants.build(book_id: params[:book_id])
    if want.save
      redirect_to wants_path, notice: "#{want.book.title}, is now wanted"
    else
      @book = Book.find(params[:book_id])
      render :new
    end
    authorize want
  end
end
