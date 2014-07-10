class WorkshopAttendee < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :person
end
