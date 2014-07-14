class OneOnOne < ActiveRecord::Base
  belongs_to :person
  default_scope -> { order('date DESC, id DESC') }
  DURATION_ENUM = [["15 minutes", 0.25], ["30 minutes",0.5], ["1 hour", 1], ["1.5 hours", 1.5], ["2 hours or more", 2.0]]
end
