class School < ActiveRecord::Base
  geocoded_by :address
  validates_presence_of :name, :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_validation :set_shortname, :if => lambda{ |obj| obj.name_changed? }

  #belongs_to :dream_director, class_name: 'User', foreign_key: 'dream_director_id'
  has_many :users
  belongs_to :site, touch: true

  has_many :people
  has_many :projects
  has_many :project_leaders, through: :projects
  has_many :engagements
  has_many :engagement_attendees, through: :engagements
  has_many :one_on_ones, through: :people
  has_many :actions
  has_many :activities, dependent: :destroy

  include Sortable

  scope :user_sort, -> (column) { order column.to_s }

  scope :by_count, -> (column) {
    select("schools.id, schools.*, count(#{column}.id) AS #{column}_count").
        joins(column.to_sym).
        group("schools.id").
        order("#{column}_count DESC")
  }

  scope :dream_team, -> (order='DESC') {
    select("schools.id, schools.*, count(people.id) AS people_count").
        joins(:people).where('people.dream_team = ?', true).
        group("schools.id").
        order("people_count #{order}")
  }
  scope :by_hours, -> (order='DESC') {
    joins(:engagements).select("schools.*, SUM(engagements.duration) AS engagement_hours").group('schools.id')
  }

  def set_shortname
    self.shortname = self.name.parameterize
  end

  def dream_director
    users.order(:id).first
  end

  def dream_team
    people.where(dream_team: true)
  end

  def schools
    site.try(:schools)
  end

  def headcount
    engagements.order('headcount DESC').limit(1).first.headcount rescue 0
  end

  def person_hours(kind="%")
    engagements.where("kind like ?", kind).where('headcount IS NOT NULL').where('duration IS NOT NULL').map{|e| (e.headcount * e.duration).to_i}.inject(:+)
  end

end
