class BooksController < ApplicationController
  def index
    @user = current_user
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @user = current_user
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def edit
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
