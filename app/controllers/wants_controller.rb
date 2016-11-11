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

    @wants_outstanding = Want.includes(:book).by_account(current_account)
    authorize Want
  end

  def new
    book = Book.find(params[:book_id])
    @want = Want.new(account: current_account, book: book)
    authorize @want
  end

  def create
    @want = current_account.wants.build(book_id: params[:book_id])
    if @want.save
      redirect_to wants_path, notice: "#{@want.book.title}, is now wanted"
    else
      render :new
    end
    authorize @want
  end

  def show
    @want = Want.includes(:book).find(params[:id])
    authorize @want
  end

  def destroy
    want = Want.find(params[:id])
    want.destroy
    redirect_to wants_path, notice: "Want withdrawn for #{want.book.title}"
    authorize want
  end
end
