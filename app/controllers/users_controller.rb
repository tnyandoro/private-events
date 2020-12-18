class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
     @user.save
     flash.alert = "User #{@user.username} has been created!"
    else
      @user = User.find_by(username: @user.username)
      flash.alert = "Welcome Back, #{@user.username}!"
    end
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash.alert = 'Logged out!'
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.permit(:username)
  end

end
