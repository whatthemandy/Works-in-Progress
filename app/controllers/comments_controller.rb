class CommentsController < ApplicationController

  # only allow unauthenticated users to access create
  before_filter :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)  # added method to helper file
    @comment.article_id = params[:article_id]
    @comment.save

    flash.notice = "Comment Created!"

    redirect_to article_path(@comment.article)
  end

  private
  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

end

