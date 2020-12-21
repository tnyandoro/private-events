class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.organize_events.build(user_params)
    if @event.save
      flash.alert = "Event #{@event.title} has been created succesfully!"
      redirect_to @event
    else
      flash.alert = @event.errors.full_messages
      render 'new'
    end
  end

  def index
    @events = Event.all
    @past_events = Event.past
    @future_events = Event.future
  end

  def show
    @event = Event.find(params[:id])
    @attendee_list = EventAttendee.where(attend_event_id: @event.id).map do |event_relation|
      User.find(event_relation.attendee_id)
    end
  end

  def attend
    @event = Event.find(params[:id])
    EventAttendee.create(attend_event: @event, attendee: current_user)
    flash.alert = "You're now attending #{@event.title}!"
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:title, :body, :date)
  end
end
