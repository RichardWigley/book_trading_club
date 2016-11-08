# BooksController
#  - the glue for book request / responses
#
class BooksController < ApplicationController
  before_action :authenticate_account!
  after_action :verify_authorized

  def index
    authorize Book
  end
end
