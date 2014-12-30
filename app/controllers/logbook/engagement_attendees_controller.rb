class Logbook::EngagementAttendeesController < Logbook::ApplicationController

  def show
    @engagement_attendee = EngagementAttendee.find(params[:id])
    redirect_to [:logbook, @engagement_attendee.engagement]
  end

end
