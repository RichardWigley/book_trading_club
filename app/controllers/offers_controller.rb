# OffersController
#  - the glue for making offers on books
#
class OffersController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def index
    search = params[:search]
    @books = Book.none
    @books = Book.search_for(search) if search.present?
    authorize Offer
  end

  def new
    @book = Book.find(params[:book_id])
    offer = Offer.new(account_id: current_account.id)
    authorize offer
  end

  def create
    offer = current_account.offers.build(book_id: params[:book_id])
    if offer.save
      redirect_to offers_path, notice: "#{offer.book.title}, has been offered"
    else
      @book = Book.find(parms[:book_id])
      render :new
    end
    authorize offer
  end
end
