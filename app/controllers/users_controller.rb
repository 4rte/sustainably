class UsersController < ApplicationController
  def new
    @user = User.new
    redirect_to edit_user_registration_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:location, :bio, :email, :first_name, :last_name, :password, :photo)
  end
end
