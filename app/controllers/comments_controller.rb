class CommentsController < ApplicationController

  def create
    book = Book.find params[:book_id]
    comment = book.comments.new(comment_params)
    comment.save
    flash[:notice] = 'Comment saved'
    redirect_to book_path(book)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :author)
  end
end
