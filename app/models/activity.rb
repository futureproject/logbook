class Activity < ActiveRecord::Base
  belongs_to :actor, polymorphic: true
  belongs_to :thing, polymorphic: true
  belongs_to :school
  validates_presence_of :thing_id, :thing_type
  include Filterable
  scope :sort, -> (column) { order column.to_s }

  before_create :set_feed_date


  def set_feed_date
    self.feed_date = created_at if self.feed_date.blank?
  end

end
