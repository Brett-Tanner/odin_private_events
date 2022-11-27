class EventMailer < ApplicationMailer
  def creation_email
    @organiser = params[:organiser]
    @event = params[:event]
    mail(to: @organiser.email, subject: "You just created #{@event.title}!")
  end
end
