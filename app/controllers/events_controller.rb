class EventsController < ApplicationController
  before_action :require_login, except: [:show, :index]

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      @event.attendees << @event.creator
      flash[:success] = "Created new event."
      redirect_to @event
    else
      flash[:warning] = "Cannot create event"
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def index
    @events = Event.all
  end
  
  def attend
    Event.find_by(id: params[:id]).attendees << current_user
    flash[:success] = "You're now attending this event!"
    redirect_to event_path
  end

  private

      def event_params
        params.require(:event).permit(:title, :location, :date)
      end
end
