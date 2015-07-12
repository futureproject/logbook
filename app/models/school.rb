class School < ActiveRecord::Base
  geocoded_by :address
  validates_presence_of :name, :address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  before_create :set_shortname

  #belongs_to :dream_director, class_name: 'User', foreign_key: 'dream_director_id'
  has_many :users
  belongs_to :site, touch: true

  has_many :people
  has_many :projects
  has_many :engagements
  has_many :engagement_attendees, through: :engagements

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
    if self.shortname.blank?
      self.shortname = self.name.split(' ').map{|x| x.first}.join('')
    end
  end

  def dream_director
    users.find_by(role: 'DD')
  end

  def dream_team
    people.where(dream_team: true)
  end

  def schools
    site.try(:schools)
  end


  # estimate the number of distinct people engaged at this school
  def engaged_people_estimate
    exact = engaged_people.count
    rough = engagements.order('enrollment DESC').limit(1).first.enrollment rescue 0
    (rough && rough > exact) ? rough : exact
  end

  # DELETE THESE STAT
  def person_hours(kind="%", times=StatCollector.default_range)
    engagements.btw(times).where("kind like ?", kind).where('headcount IS NOT NULL').where('duration IS NOT NULL').map{|e| (e.headcount * e.duration).to_i}.inject(:+)
  end

  def engaged_people
    people.joins(:engagements).uniq
  end

  def people_with_projects_count
    people.joins(:projects).uniq.count
  end

  def as_json
    {
      id: self.id,
      name: self.name,
      shortname: self.shortname,
      namespace: self.class.name.tableize,
      dd_name: self.dream_director.try(:name),
      city_name: self.site.name,
    }
  end

end
