class Site < ActiveRecord::Base
  geocoded_by :name
  validates_presence_of :name
  after_validation :geocode, :if => lambda{ |obj| obj.name_changed? }
  before_create :set_shortname

  belongs_to :captain, foreign_key: 'captain_id', class_name: 'Person'
  has_many :schools
  has_many :people
  has_many :projects, through: :schools
  has_many :engagements
  has_many :engagement_attendees, through: :engagements
  has_many :report_submissions, through: :people


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
    people.with_accounts
  end

  def dream_team
    people.where(dream_team: true)
  end

  def person_hours(kind="%")
    engagements.where("kind like ?", kind).where('headcount IS NOT NULL').where('duration IS NOT NULL').map{|e| (e.headcount * e.duration).to_i}.inject(:+)
  end

  def people_with_projects_count
    people.joins(:project_people).uniq.count
  end

  def engaged_people_estimate
    durations = schools.map{|school| school.engaged_people_estimate }
    durations.inject(:+)
  end

  def enrollment
    schools.sum(:enrollment)
  end

  def as_json
    {
      id: self.id,
      name: self.name,
      shortname: self.shortname,
      namespace: self.class.name.tableize,
      chief_name: self.captain.try(:name),
    }
  end

  def set_shortname
    if self.shortname.blank?
      self.shortname = self.name.split(' ').map{|x| x.first}.join('')
    end
  end

end
