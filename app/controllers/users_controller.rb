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
    @past_created_events = current_user.organize_events.past
    @future_created_events = current_user.organize_events.future

    @past_attended_event_list = EventAttendee.where(attendee_id: @user.id).filter_map do |event_relation|
      Event.past.find_by_id(event_relation.attend_event_id)
    end
    @future_attended_event_list = EventAttendee.where(attendee_id: @user.id).filter_map do |event_relation|
      Event.future.find_by_id(event_relation.attend_event_id)
    end
  end

  private

  def user_params
    params.permit(:username)
  end
end
