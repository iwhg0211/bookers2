class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user)
     else
        render :edit
        @user = User.find(params[:id])
     end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
     if @user != current_user
       redirect_to(user_path(current_user.id))
     end
  end
end
