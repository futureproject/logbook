class Activity < ActiveRecord::Base
  belongs_to :actor, polymorphic: true
  belongs_to :thing, polymorphic: true
  belongs_to :school
  validates_presence_of :thing_id, :thing_type

  before_create :set_feed_date


  def set_feed_date
    self.feed_date = created_at if self.feed_date.blank?
  end

end
