class ParticipantController < ApplicationController
  def create
    event = Event.find(params[:id])

    if event.attendees.include?(current_user)
      flash.now[:alert] = "You're already going to this event!"
    else
      current_user.attended_events << event
      flash.now[:notice] = "Successfully signed up for this event"
      redirect_to event_path(event)
    end
  end
end