class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :require_current_user, only: [:edit, :update, :destroy]

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.new
    @book_show = Book.find(params[:id])
    @user = @book_show.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def require_current_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
