class Engagement < ActiveRecord::Base
  belongs_to :school
  belongs_to :user
  has_many :engagement_attendees
  has_many :attendees, through: :engagement_attendees, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  has_many :activities, as: :thing, dependent: :destroy
  after_create :log_activity
  validates_presence_of :date
  attr_accessor :attendee_ids
  KIND_ENUM = ['Coaching Session', 'Event', 'Meeting', 'Workshop']
  DURATION_ENUM = [
    ['5 Minutes', 0.08333],
    ['15 Minutes', 0.25],
    ['30 Minutes', 0.5],
    ['45 Minutes', 0.75],
    ['1 Hour', 1.0],
    ['2 Hours', 2.0],
    ['3 Hours', 3.0],
    ['4 Hours', 4.0],
    ['5 Hours', 5.0],
    ['6 Hours', 6.0],
    ['7+ Hours', 8.0]
  ]

  include Filterable
  scope :sort, -> (column) { order column.to_s }
  scope :q, -> (query) { where("lower(name) like ?", "%#{query.downcase}%") }

  def log_activity
    Activity.create(
      actor_id: self.user.try(:id),
      actor_type: self.user.class.try(:name),
      thing_id: id,
      thing_type: self.class.name,
      school_id: self.school_id,
      feed_date: self.date
    )
  end

end
