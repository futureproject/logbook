class Site < ActiveRecord::Base
  geocoded_by :name
  validates_presence_of :name
  after_validation :geocode, :if => lambda{ |obj| obj.name_changed? }

  belongs_to :captain, foreign_key: 'captain_id', class_name: 'User'
  has_many :schools
  has_many :dream_directors, through: :schools
  has_many :people, through: :schools
  has_many :weekly_log_entries, through: :dream_directors

  def engagement_score
    people.includes(:weekly_log_entries).average(:quality)
  end

  def attendance_score
    attended = weekly_log_entries.where(attended_meeting: true).count
    total = weekly_log_entries.count
    (attended.to_f / total.to_f).to_s
  end

end
