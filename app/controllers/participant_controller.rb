class ParticipantController < ApplicationController
  def create
    event = Event.find(params[:event_id])

    current_user.attended_events << event
      
    flash[:notice] = "Successfully signed up for this event"
    redirect_to event_path(event)
  end

  def destroy
    event = Event.find(params[:event_id])

    current_user.attended_events.delete(event)
    
    flash[:notice] = "You are no longer attending this event"
    redirect_to event_path(event)
  end
end