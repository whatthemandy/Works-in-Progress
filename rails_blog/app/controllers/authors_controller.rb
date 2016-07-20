class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  # only allow unauthenticated users to access new/create
  before_filter :require_login, except: [:new, :create]

  before_filter :zero_authors_or_authenticated, only: [:new, :create]

  # check if there are either 0 registered users OR if there is a user already logged in
  # if neither is true, redirect to root path (our articles list) and return false
  # if either one of them is true, this filter won’t do anything
  # (allowing the requested user registration form to be rendered)
  # -- that way when the app is first setup we can create an account,
  # new users can only be created by a logged in user
  def zero_authors_or_authenticated
    unless Author.count == 0 || current_user
      redirect_to root_path
      return false
    end
  end

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:username, :email, :password, :password_confirmation)
    end
end
