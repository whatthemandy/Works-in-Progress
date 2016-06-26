class BooksController < ApplicationController

  def index
    # @books = Book.all  # updated to accommodate pagination:
    @books = Book.paginate :page => params[:page], :per_page => 10
  end

  def show
    @book = Book.find(params[:id])
    # @comments = @book.comments  # updated to accommodate pagination:
    @comments = @book.comments.paginate :page => params[:page], :per_page => 10
    # to sort by descending:
    # @comments = @book.comments.order('created_at DESC').paginate :page => params[:page], :per_page => 5
  end

end
