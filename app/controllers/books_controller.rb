class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)#これあってる？なんか変
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
  end

  def index
    @books = Book.all
    @user = current_user#自分を表示
    @book = Book.new(params[:id])#これあってる？なんか変
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
