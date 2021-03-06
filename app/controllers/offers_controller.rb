# OffersController
#  - the glue for making offers on books
#
class OffersController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def index
    search = params[:search]
    @books_search = Book.none
    @books_search = Book.search_for(search) if search.present?

    @offers_outstanding = current_account.offers.includes(:book).untraded
    authorize Offer
  end

  def new
    book = Book.find(params[:book_id])
    @offer = BuildOfferTrade.new(offer: Offer.new(account: current_account, book: book)).build.offer
    authorize @offer
  end

  def create
    @offer = BuildOfferTrade.new(offer: current_account.offers.build(book_id: params[:book_id])).build.offer
    if @offer.save
      redirect_to offers_path, notice: "#{@offer.book.title}, has been offered"
    else
      render :new
    end
    authorize @offer
  end

  def show
    @offer = Offer.includes(:book).find(params[:id])
    authorize @offer
  end

  def destroy
    offer = Offer.find(params[:id])
    offer.destroy
    redirect_to offers_path, notice: "Offer withdrawn for #{offer.book.title}"
    authorize offer
  end
end
