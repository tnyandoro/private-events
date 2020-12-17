class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash.alert = "Welcome, #{@user.username}"
      session[:user_id] = @user.id
    else
      flash.alert = "Please enter a unique username (Usernames are not case-sensitive)"
    end
  end

  def show
    @user = User.find(params[:id])
  end
end

private
def user_params
 params.permit(:username)
end
