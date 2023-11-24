class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(user_params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)  
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_images, :introduction)
  end
end
