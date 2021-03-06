class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".success"
      log_in @user
      redirect_to root_path
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :phone, :password, :password_confirmation
  end
end
