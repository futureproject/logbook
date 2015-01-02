class Engagement < ActiveRecord::Base
  belongs_to :school
  belongs_to :user
  has_many :engagement_attendees, dependent: :destroy
  has_many :attendees, through: :engagement_attendees, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  has_many :activities, as: :thing, dependent: :destroy
  after_create :log_activity
  validates_presence_of :date
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

  COLOR_ENUM = %w(#b363a4 #dcaad3 #8a2f78 #5b094b)

  include Filterable
  scope :sort, -> (column) { order column.to_s }
  scope :q, -> (query) { where("lower(engagements.name) like ?", "%#{query.downcase}%") }
  scope :one_on_ones, -> { joins(:engagement_attendees).group('engagements.id').having('count(engagement_attendees.id)=1') }

  scope :with_attendees, -> (table) {
    joins(:attendees).select("engagements.*, COUNT(#{table}.id) AS #{table}_count").group("engagements.id")
  }

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

  def custom_clone
    clone = self.dup
    clone.date = Date.today
    clone.attendee_ids = self.attendee_ids
    clone
  end

end
