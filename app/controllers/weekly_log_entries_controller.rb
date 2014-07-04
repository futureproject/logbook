class WeeklyLogEntriesController < ApplicationController

  def new
    @people = current_user.people.order(:first_name, :id)
    # get the next student, ordered by first name
    # next means this person doesn't have an entry for this week
    @subject = view_context.next_person(@people)
    @weekly_log_entry = WeeklyLogEntry.new( user: current_user, person: @subject)
  end

  def create
    @weekly_log_entry = WeeklyLogEntry.new(weekly_log_entry_params)
    respond_to do |format|
      format.html { render :new }
      format.json { render status: :created, location: @weekly_log_entry }
    end
  end

  private
    def weekly_log_entry_params
      params.require(:weekly_log_entry).permit!
    end
end

