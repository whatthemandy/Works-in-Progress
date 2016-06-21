class CommentsController < ApplicationController

  def create
    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]
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

