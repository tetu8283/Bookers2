class UsersController < ApplicationController
  # ログインした人のみ
  before_action :authenticate_user!
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)  
  end

  def index
    @users = User.all
    # 今ログイン中のユーザの情報を渡してshowを表示しているaa
    @user = current_user
    # 新規投稿用の@book
    @book = Book.new
  end
  
  def show
    # @book = Book.find(params[:id])
    @user = User.find(params[:id])
     # 新規投稿用の@book
    @book = Book.new
    @books = @user.books
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_images, :introduction)
  end
end
