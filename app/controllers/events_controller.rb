class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.organize_events.new(user_params)
    if @event.save
      flash.alert = "Event #{@event} has been created succesfully!"
      render 'new'
    else
      flash.alert = @event.errors.full_messages
      render 'new'
    end
    render 'new'
  end

  def index
  end

  def show
  end

  private
  def user_params
    params.permit(:title, :body, :date, :location)
  end


end
