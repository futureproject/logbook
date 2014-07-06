class WeeklyLogEntriesController < ApplicationController

  def new
    @week = Date.today.beginning_of_week
    @people = current_user.people
      .where(core: true)
      .order(:first_name, :id)
    @people_filed = @people.with_entries_for_week(@week)
    @people_left = @people - @people_filed
    if @people_left.count == 0
      flash[:notice] = "High fives! You're done this week!"
    end
    @weekly_log_entry = WeeklyLogEntry.new
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

