class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :school_id
  belongs_to :school
  has_one :site, through: :school
  has_many :project_participants, dependent: :destroy
  has_many :project_leaders, dependent: :destroy
  has_many :primary_projects, through: :project_leaders, source: :project
  has_many :secondary_projects, through: :project_participants, source: :project
  has_many :one_on_ones
  has_many :engagement_attendees, dependent: :destroy
  has_many :engagements, through: :engagement_attendees
  has_many :actions, as: :actor
  has_many :reports, dependent: :destroy
  has_many :testimonials, dependent: :destroy
  has_many :student_reflections, class_name: "Reflection", as: :reflectable, dependent: :destroy
  has_many :assets, as: :attachable
  has_one :identity, dependent: :destroy
  ROLE_ENUM = %w(student teacher staff)
  GRADE_ENUM = [6, 7, 8, 9, 10, 11, 12]
  SEX_ENUM = %w(male female other)

  scope :search, lambda {|query, user=nil|
    return if query.blank?
    first = "%#{query.split(' ').first.downcase}%"
    last = "%#{query.split(' ').last.downcase}%"
    results = self.all.limit(200)
    if first == last
      results = results.where("lower(first_name) like ? or lower(last_name) like ?", first, last).
        order('lower(first_name)').limit(10)
    else
      results = results.where("lower(first_name) like ? and lower(last_name) like ?", first, last).
        order('lower(first_name)').limit(10)
    end
    if user && user.site
      school_results = user.school ? results.joins(:school).where('schools.id=?', user.school_id) : results.none
      site_results = results.joins(:site).where('sites.id=?', user.site.id)
      results = (school_results + site_results + results).flatten.uniq
    end
    results.first(10)
  }

  def name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name.first}#{last_name.first}"
  end

  def dream_director
    school.dream_director
  end

  def logged_hours
    engagements.sum(:duration).to_i
  end

  def leads_project?(project)
    project.leaders.include? self
  end

  def auth_token
    identity.token
  end

  def school_name
    school.try(:name)
  end

  def works_at_tfp
    false
  end

  # takes a CSV from the public directory and a User object
  # imports students into the system
  def self.import_from_csv(filename, dream_director)
    CSV.foreach("#{Rails.root.to_s}/public/#{filename}", headers: true) do |row|
      p = Person.create!(row.to_hash.merge(school_id: dream_director.school_id))
    end
  end

  def self.matches_by_name first, last
    t = self.arel_table
    self.where(t[:first_name].matches("%#{first}"))
      .where(t[:last_name].matches("%#{last}"))
  end

  def self.find_by_auth_token(token)
    Identity.find_by(token: token).try(:person)
  end

end
