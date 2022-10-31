class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
      
  end

  def destroy
    event = Event.find(params[:id])

    if event.destroy
      redirect_to root_path
      flash[:notice] = "#{event.title} was successfully cancelled"
    else
      flash.now = "An error occurred, #{event.title} wasn't cancelled"
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description, :date)
  end
end
