class WeeklyLogEntriesController < ApplicationController

  def new
    @people = current_user.people
      .where(core: true)
      .order(:first_name, :id)
      .includes(:entry_this_week)
    @subject = view_context.next_person(@people)
    @people_left = @people.count - @people.joins(:entry_this_week).count
    flash[:notice] = "High fives! You're done this week!" if @people_left == 0
    @weekly_log_entry = WeeklyLogEntry.new( user: current_user, person: @subject)
  end

  def create
    @weekly_log_entry = WeeklyLogEntry.new(weekly_log_entry_params)
    if @weekly_log_entry.save
      respond_to do |format|
        format.html { redirect_to new_weekly_log_entry_path }
        format.js { render status: :created, location: @weekly_log_entry }
      end
    else
      respond_to do |format|
       format.html { redirect_to new_weekly_log_entry_path, flash: {error: 'Please record both fields'} }
        format.js { render status: :unprocessable_entity }
      end
    end
  end

  private
    def weekly_log_entry_params
      params.require(:weekly_log_entry).permit!
    end
end

