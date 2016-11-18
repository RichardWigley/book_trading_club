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

    @wants_outstanding = current_account.wants.includes(:book).untraded
    authorize Want
  end

  def new
    book = Book.find(params[:book_id])
    @want = Want.new(account: current_account, book: book)
    if current_account.completed?
      session[:book_wanted] = nil
    else
      session[:book_wanted] = new_book_want_path(book)
      render :complete_contact
    end
    authorize @want
  end

  def create
    @want = BuildWantTrade.new(want: current_account.wants.build(book_id: params[:book_id])).build.want
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
