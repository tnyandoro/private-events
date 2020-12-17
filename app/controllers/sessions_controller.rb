class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash.alert = "Welcome, #{@user.username}"
      session[:user_id] = @user.id
    else
      flash.alert = "Please enter a unique username (Usernames are not case-sensitive)"
      render 'users/new'
    end
  end

  def destroy
    session[:user_id] = nil
    session.clear
    # redirect_to root_path, flash: 'Logged Out!'
    flash.alert = 'Logged out!'
    render 'users/new'
  end
end
