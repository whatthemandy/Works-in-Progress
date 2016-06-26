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

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "#{@book.title} saved."
      redirect_to @book
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :thoughts)
  end
end
