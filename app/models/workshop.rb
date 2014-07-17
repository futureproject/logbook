class Workshop < ActiveRecord::Base
  belongs_to :school
  has_many :workshop_attendees
  has_many :attendees, through: :workshop_attendees, source: :person
end
