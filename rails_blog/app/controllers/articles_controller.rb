class ArticlesController < ApplicationController

  # only allow unauthenticated users to access index/show
  before_filter :require_login, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

    # so we can create new comments with the new comment form
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.create(params[:article]) - need strong parameters
    @article = Article.create(article_params)

    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    flash.notice = "Article '#{article.title}' Destroyed!"

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
