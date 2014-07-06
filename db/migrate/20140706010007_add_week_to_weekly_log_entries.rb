class AddWeekToWeeklyLogEntries < ActiveRecord::Migration
  def change
    add_column :weekly_log_entries, :week, :date
  end
end
