class School < ActiveRecord::Base
  #geocoded_by :address
  validates_presence_of :name, :address
  #after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  after_validation :archive_people, :if => lambda{ |obj| obj.active_changed? }
  before_create :set_shortname

  belongs_to :site, touch: true
  has_many :people
  has_many :projects
  has_many :engagements
  has_many :engagement_attendees, through: :engagements
  has_many :report_submissions, through: :people

  include Activatable

  def set_shortname
    if self.shortname.blank?
      self.shortname = self.name.split(' ').map{|x| x.first}.join('')
    end
  end

  def dream_director
    people.find_by(role: 'DD') || people.find_by(role: 'CHIEF')
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

  def archive_people
    return true if self.active
    self.people.where("role = ? OR role = ? OR role = ?", "student", "staff", "teacher").each do |p|
      p.update active: false
    end
  end

  def dedup
    puts "Deduping #{self.name}"
    count = self.people.count
    unique_names = self.people.group_by{|p| [p.first_name.downcase, p.last_name.downcase]}
    unique_names.each do |name, people|
      next if people.length < 2
      puts "Deduping #{people.length} named #{name}"
      ids = people.map(&:id)
      Person.dedup ids
    end
    puts "deduped #{count - self.people.count} from #{self.name}"
  end

end
