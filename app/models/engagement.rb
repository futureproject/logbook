class Engagement < ActiveRecord::Base
  belongs_to :school, touch: true
  belongs_to :site, touch: true
  belongs_to :user
  has_many :engagement_attendees, dependent: :destroy
  has_many :attendees, through: :engagement_attendees, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  has_many :activities, as: :thing, dependent: :destroy
  after_create :log_activity
  before_create :autoname
  before_save :set_site
  before_save :set_headcount
  validates_presence_of :date
  KIND_ENUM = ['Coaching Session', 'Event', 'Meeting', 'Workshop']
  DURATION_ENUM = [
    ['5 Minutes', 0.1],
    ['15 Minutes', 0.25],
    ['30 Minutes', 0.5],
    ['45 Minutes', 0.75],
    ['1 Hour', 1.0],
    ['1.5 Hours', 1.5],
    ['2 Hours', 2.0],
    ['3 Hours', 3.0],
    ['4 Hours', 4.0],
    ['5 Hours', 5.0],
    ['6 Hours', 6.0],
    ['7 Hours', 7.0],
    ['8 Hours', 8.0]
  ]

  COLOR_ENUM = %w(#b363a4 #56304f #f1c7e9 #8457b3)

  include Sortable
  scope :user_sort, -> (column) { order column.to_s }
  scope :q, -> (query) { where("lower(engagements.name) like ?", "%#{query.downcase}%") }
  scope :one_on_ones, -> { joins(:engagement_attendees).group('engagements.id').having('count(engagement_attendees.id)=1') }
  scope :week_of, -> (date) { where(date: date.beginning_of_week..date.end_of_week) }
  scope :since, -> (date) { where('date >= ?', date) }
  scope :with_attendees, -> (table) {
    joins(:attendees).select("engagements.*, COUNT(#{table}.id) AS #{table}_count").group("engagements.id")
  }

  def autoname
    if self.name.blank?
      attendees = Person.where(id: attendee_ids).order(:first_name).limit(3)
      if attendees.any?
        self.name = kind + ' w/ ' + attendees.pluck(:first_name).join(', ')
      else
        self.name = "Unnamed #{kind}"
      end
    else
      true
    end
  end

  def set_site
    if self.school
      self.site_id = self.school.try(:site).try(:id)
    else
      self.site_id = self.user.try(:site).try(:id)
    end
    true
  end

  def set_headcount
    if headcount.blank? || !kind.match(/event/i)
      self.headcount = attendees.size
    end
  end

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

  def self.as_bubbles(scope=self.all)
    scope.order(:kind).group_by(&:kind).map{|k,v| { name: k, data: v.map{|e| { x: e.date.to_datetime.to_i*1000, y: e.duration, z: e.headcount, title: e.name, id: e.id, notes: e.notes.try(:first, 44) } } } }
  end

end
