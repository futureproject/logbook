class Site < ActiveRecord::Base
  geocoded_by :name
  validates_presence_of :name
  after_validation :geocode, :if => lambda{ |obj| obj.name_changed? }

  belongs_to :captain, foreign_key: 'captain_id', class_name: 'User'
  has_many :schools
  has_many :users
  has_many :people
  has_many :projects, through: :schools
  has_many :project_leaders, through: :people
  has_many :project_participants, through: :people
  has_many :engagements
  has_many :engagement_attendees, through: :engagements
  include Sortable
  scope :user_sort, -> (column) { order column.to_s }

  scope :by_count, -> (column) {
    select("sites.id, sites.*, count(#{column}.id) AS #{column}_count").
        joins(column.to_sym).
        group("sites.id").
        order("#{column}_count DESC")
  }

  def average association, column=nil
    begin
      if column.nil?
        stat = (eval(association.to_s).count.to_f / schools.count.to_f).to_s
      else
        stat = eval(association.to_s).average(column.to_sym)
      end
      stat || 0
    rescue
      0
    end
  end

  def staff
    ([captain] + users).flatten
  end

  def dream_team
    people.where(dream_team: true)
  end

  def person_hours(kind="%")
    engagements.where("kind like ?", kind).where('headcount IS NOT NULL').where('duration IS NOT NULL').map{|e| (e.headcount * e.duration).to_i}.inject(:+)
  end

  def people_with_projects
    (people.joins(:primary_projects) + people.joins(:secondary_projects)).uniq.count
  end

  def engaged_people_estimate
    durations = schools.map{|school| school.engaged_people_estimate }
    durations.inject(:+)
  end

  def enrollment
    schools.sum(:enrollment)
  end

end
