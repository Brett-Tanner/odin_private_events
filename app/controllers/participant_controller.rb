class ParticipantController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    user = User.find(params[:id])

    user.attended_events << event
      
    flash[:notice] = "#{user.name} was invited"
    redirect_to event_path(event)
  end

  def destroy
    event = Event.find(params[:event_id])
    user = User.find(params[:id])

    user.attended_events.delete(event)
    
    flash[:notice] = "#{user.name} is no longer invited"
    redirect_to event_path(event)
  end
end