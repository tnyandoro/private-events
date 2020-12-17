class UsersController < ApplicationController
  def new
    @user = User.new
    params[:username] = cookies[:username] unless cookies[:username].nil?
  end


  def create
    if @user
      cookies[:user_id] = @user.id
      cookies[:username] = {:value => params[:username].downcase, :expires => 2.weeks.from_now }
    else
      @user = User.new
      @user.username = cookies[:username]
      @user.save
    end
  end

  def show
    cookies
    # @user = User.find(params[:id])
  end
end
