class BooksController < ApplicationController

  def index
    # @books = Book.all  # updated to accommodate pagination:
    @books = Book.paginate :page => params[:page], :per_page => 10
  end

end
