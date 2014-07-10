class Workshop < ActiveRecord::Base
  belongs_to :school
  has_many :workshop_attendees
end
