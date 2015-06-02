class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  belongs_to :school, touch: true
  belongs_to :user, touch: true
  belongs_to :site, touch: true
  has_many :project_participants, dependent: :destroy
  has_many :project_leaders, dependent: :destroy
  has_many :primary_projects, through: :project_leaders, source: :project
  has_many :secondary_projects, through: :project_participants, source: :project
  has_many :one_on_ones
  has_many :engagement_attendees, dependent: :destroy
  has_many :engagements, through: :engagement_attendees
  has_many :actions, as: :actor
  has_many :activities, as: :actor, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :testimonials, dependent: :destroy
  has_many :student_reflections, class_name: "Reflection", as: :reflectable, dependent: :destroy
  has_many :assets, as: :attachable
  has_one :identity, dependent: :destroy
  before_save :set_site
  before_save :downcase_name
  ROLE_ENUM = %w(student teacher staff)
  GRADE_ENUM = [6, 7, 8, 9, 10, 11, 12]
  SEX_ENUM = %w(M F)
  DREAM_TEAM_ENUM = [["Yep", true],["Nope", false]]
  COLOR_ENUM = %w(#42C8EE #036B89 #7c878a)
  include Sortable

  scope :search, lambda {|query, user=nil|
    return if query.blank?
    first = "%#{query.split(' ').first.downcase}%"
    last = "%#{query.split(' ').last.downcase}%"
    operator = first == last ? "or" : "and"
    results = self.all.limit(200)
    results = results.where("lower(first_name) like ? #{operator} lower(last_name) like ?", first, last).order('lower(first_name)').limit(10)
    if user && user.site
      school_results = user.school ? results.joins(:school).where('schools.id=?', user.school_id) : results.none
      site_results = results.joins(:site).where('sites.id=?', user.site.id)
      results = (school_results + site_results + results).flatten.uniq
    end
    results.first(10)
  }

  scope :user_sort, -> (column) {
    order "#{column.to_s}"
  }

  scope :q, -> (query) {
    first = "%#{query.split(' ').first.downcase}%"
    last = "%#{query.split(' ').last.downcase}%"
    operator = first == last ? "or" : "and"
    where("lower(first_name) like ? #{operator} lower(last_name) like ?", first, last)
  }

  scope :with_engagements, -> (kind) {
    joins(:engagements).where('engagements.kind = ?', kind).select("people.*, COUNT(engagements.id) AS engagements_count").group('people.id')
  }

  scope :with_hours, -> (kind) {
    joins(:engagements).where('engagements.kind = ?', kind).select("people.*, SUM(engagements.duration) AS engagement_hours").group('people.id')
  }

  scope :with_projects, -> (kind='primary') {
    joins("#{kind}_projects".to_sym).select("people.*, COUNT(projects.id) AS projects_count").group('people.id')
  }

  scope :created_before, -> (date) { where(created_at: 100.years.ago..date.end_of_week) }
  scope :week_of, -> (date) { where(created_at: date.beginning_of_week..date.end_of_week) }
  scope :in_grade, -> (grade) { where(grade: grade.to_i) }
  scope :in_group, -> (group) {
    if group.match /dream/i
      where(dream_team: true)
    else
      where(role: group)
    end
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

  def projects
    (primary_projects.order('id DESC') + secondary_projects.order('id DESC')).flatten
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

  def set_site
    if self.school
      self.site_id = self.school.try(:site).try(:id)
    else
      self.site_id = self.user.try(:site).try(:id)
    end
    true
  end

  def downcase_name
    self.first_name = self.first_name.try(:downcase)
    self.last_name = self.last_name.try(:downcase)
  end

  # takes a CSV from the public directory and a User object
  # imports students into the system
  def self.import_from_csv(filename, dream_director)
    CSV.foreach("#{Rails.root.to_s}/public/#{filename}", headers: true) do |row|
      data = row.to_hash
      if dream_director.people.where(first_name: data['first_name'], last_name: data['last_name']).any?
        puts "person #{data['first_name']} #{data['last_name']} already exists"
      else
        p = Person.create!(data.merge(school_id: dream_director.school_id))
        puts "created #{p.name}"
      end
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

  def self.dedup ids
    duplicates = self.where(id: ids).order(:id)
    primary = duplicates.select{|p| p.identity.present? || p.dream_team }.first || duplicates.first
    primary.notes ||= ""
    count = duplicates.count
    duplicates = duplicates.where.not(id: primary.id).order(:id)
    puts "merging #{primary.name} with #{duplicates.count} other records..."
    duplicates.each do |p|
      p.engagement_attendees.each do |r|
        r.update_attributes person_id: primary.id
      end
      p.project_leaders.each do |r|
        r.update_attributes person_id: primary.id
      end
      p.project_participants.each do |r|
        r.update_attributes person_id: primary.id
      end
      p.activities.each do |r|
        r.update_attributes actor_id: primary.id
      end
      primary.notes += p.notes.to_s
      p.delete
    end
    puts "merged #{count} people into #{primary.name}, id #{primary.id}"
    primary.save
    primary.touch
  end

  def self.as_bubbles(scope=self.all)
    scope.order(:dream_team).joins(:engagements).select('people.id, people.first_name, people.last_name, people.dream_team, SUM(engagements.duration) AS hours').group('people.id').group_by(&:dream_team).map{|k,v| { name: (k ? "Dream-Team" : "Non Dream-Team"), data: v.map{|p| { x: p.hours, y: p.engagements.count, z: p.projects.count, title: p.name, id: p.id } } } }
  end

  def self.as_project_pie_chart(scope=self.all)
    primary = scope.joins(:primary_projects).uniq
    secondary = scope.joins(:secondary_projects).uniq
    secondary = secondary - primary
    logger.info secondary.size
    {
      "Leading" => primary.count,
      "Supporting" => secondary.count
    }
  end

end
