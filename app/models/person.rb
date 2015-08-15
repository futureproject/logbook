class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  belongs_to :school, touch: true
  belongs_to :user, touch: true
  belongs_to :site, touch: true
  has_many :project_people, dependent: :destroy
  has_many :projects, through: :project_people
  has_many :primary_projects, -> { where(project_people: { leading: true }) }, through: :project_people, source: :project
  has_many :secondary_projects, -> { where(project_people: { leading: false }) }, through: :project_people, source: :project
  has_many :engagement_attendees, dependent: :destroy
  has_many :engagements, through: :engagement_attendees
  has_many :notes, as: :notable, dependent: :destroy
  has_many :assets, as: :attachable
  has_one :identity, dependent: :destroy
  before_save :set_site
  ROLE_ENUM = %w(student teacher staff)
  GRADE_ENUM = [6, 7, 8, 9, 10, 11, 12]
  SEX_ENUM = %w(M F)
  DREAM_TEAM_ENUM = [["Yep", true],["Nope", false]]
  COLOR_ENUM = %w(#42C8EE #036B89 #7c878a #419AD3 #568099)

  scope :with_engagements, -> (dates) {
    joins(:engagements).select("people.*, COUNT(engagements.id) AS engagements_count")
    .merge(Engagement.btw(dates))
    .group('people.id')
  }

  scope :with_projects, -> (dates) {
    joins(:projects).select("people.*, COUNT(projects.id) AS projects_count")
    .merge(Project.btw(dates))
    .group('people.id')
  }

  scope :conditionally_joined, -> (params, stat_times) {
    if params[:sort_by] == "projects_count"
      with_projects(stat_times)
    elsif params[:sort_by] == "engagements_count"
      with_engagements(stat_times)
    elsif params[:q]
      q(params[:q])
    else
      all
    end
  }
  scope :active, -> { where(graduated_in: nil) }

  scope :q, -> (query) {
    return if query.blank?
    first = "%#{query.split(' ').first.downcase}%"
    last = "%#{query.split(' ').last.downcase}%"
    operator = first == last ? "or" : "and"
    where("first_name like ? #{operator} last_name like ?", first, last)
    .order("dream_team DESC, first_name ASC")
  }

  scope :with_hours, -> (kind="%") {
    joins(:engagements).where('engagements.kind like ?', kind).select("people.*, SUM(engagements.duration) AS engagement_hours").group('people.id')
  }

  scope :created_before, -> (date) { where(created_at: 100.years.ago..date.end_of_week) }
  scope :btw, -> (range) { where(created_at: range) }
  scope :leading_projects, -> {
    joins(:project_people).where(project_people: {leading: true}).uniq
  }
  scope :just_supporting_projects, -> {
    joins(:project_people).where(project_people: {leading: false})
    .where('people.id NOT IN (SELECT (person_id) FROM project_people WHERE project_people.leading IS true)')
    .uniq
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

  def set_site
    if self.school
      self.site_id = self.school.try(:site).try(:id)
    else
      self.site_id = self.user.try(:site).try(:id)
    end
    true
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
      p.project_people.each do |r|
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

  # rewrite in SQL
  def self.meaningfully_engaged(scope=self.all)
    (scope.joins(:engagements) + scope.joins(:projects)).flatten.uniq
  end

end
