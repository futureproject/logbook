class Engagement < ActiveRecord::Base
  belongs_to :school, touch: true
  belongs_to :site, touch: true
  belongs_to :creator, class_name: "Person", foreign_key: "creator_id"
  has_many :engagement_attendees, dependent: :destroy
  has_many :attendees, through: :engagement_attendees, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  has_many :notes, as: :notable, dependent: :destroy, inverse_of: :notable
  accepts_nested_attributes_for :notes
  has_many :project_engagement_links
  has_many :projects, through: :project_engagement_links
  before_create :autoname
  before_save :set_site
  before_save :set_headcount
  validates_presence_of :date
  KIND_ENUM = ['Coaching Session', 'Event', 'Course', 'Meeting']
  DURATION_ENUM = [
    ['5 Minutes', 0.083],
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

  include Joinable
  scope :btw, -> (range) { where(date: range) }
  scope :week_of, -> (date) { where(date: date.beginning_of_week..date.end_of_week) }
  scope :since, -> (date) { where('date >= ?', date) }
  scope :this_school_year, -> { where(date: StatCollector.default_range) }
  scope :with_attendees, -> (table) {
    joins(:attendees).select("engagements.*, COUNT(#{table}.id) AS #{table}_count").group("engagements.id")
  }
  # These scopes are all used on Logbook Index table filters
  scope :by_kind, -> (kind) { where(kind: kind) }
  scope :by_duration, -> (duration) { where("duration >= ?", duration) }
  scope :by_headcount, -> (count) { where("headcount >= ?", count) }
  scope :by_notes_count, -> (count) { where("engagements.notes_count >= ?", count) }
  scope :by_engagement_dates, -> (t_start=StatCollector.default_range.first, t_end=StatCollector.default_range.last) {
    t_start = t_start.blank? ? StatCollector.default_range.first : Date.parse(t_start)
    t_end = t_end.blank? ? StatCollector.default_range.last : Date.parse(t_end)
    range = t_start..t_end
    self.btw(range)
  }
  # End Filter scopes
  scope :q, -> (query) {
    name_matches = where("engagements.name like ?", "%#{query.downcase}%")
    tag_matches = hashtagged(query)
    where("#{table_name}.id in (?)", (name_matches + tag_matches).map(&:id))
  }
  scope :coaching_sessions, -> { where(kind: "Coaching Session") }

  include Hashtaggable
  hashtaggable_attribute :description

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
      self.site_id = self.creator.try(:site).try(:id)
    end
    true
  end

  def set_headcount
    if headcount.blank? || !kind.match(/event/i)
      self.headcount = attendees.size
    end
  end

  def custom_clone
    clone = self.dup
    clone.date = Date.today
    clone.attendee_ids = self.attendee_ids
    clone
  end

  def self.person_hours(scope: self.all, kind: '%', times: StatCollector.default_range)
    scope.btw(times).where("kind like ?", kind).where('duration IS NOT NULL').where('headcount IS NOT NULL').map{|e| (e.headcount * e.duration).to_i}.inject(:+)
  end

end
