class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # def create
  # end

  def show
    @user = Users.find[:id]
  end
end
