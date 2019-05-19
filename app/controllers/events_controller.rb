class EventsController < ApplicationController
  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
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

  private

      def event_params
        params.require(:event).permit(:title)
      end
end
