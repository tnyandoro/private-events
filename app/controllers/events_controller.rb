class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.organize_events.new(user_params)
    if @event.save
      flash.alert = "Event #{@event.title} has been created succesfully!"
    else
      flash.alert = @event.errors.full_messages
    end
    redirect_to events_path
  end

  def index
    @events = Event.all
  end

  def show
  end

  private
  def user_params
    params.permit(:title, :body, :date, :location)
  end


end
