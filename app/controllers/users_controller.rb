class UsersController < ApplicationController
  # before_action :require_sign_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] =@user.id
    flash.alert = "User #{@user.username} has been created!"
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.permit(:username)
  end

  def require_sign_in
    if @user.nil?
      flash.alert = 'Please log in'
      redirect_to new_user_path
    end
  end
end