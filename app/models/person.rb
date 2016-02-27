class Person < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :role
  validates_uniqueness_of :email, allow_blank: true
  belongs_to :school, touch: true
  belongs_to :site, touch: true
  belongs_to :creator, class_name: "Person", foreign_key: "creator_id"
  has_many :identities
  has_many :created_people, class_name: "Person", foreign_key: "creator_id"
  has_many :project_people, dependent: :destroy
  has_many :projects, through: :project_people
  has_many :primary_projects, -> { where(project_people: { leading: true }) }, through: :project_people, source: :project
  has_many :secondary_projects, -> { where(project_people: { leading: false }) }, through: :project_people, source: :project
  has_many :engagement_attendees, dependent: :destroy
  has_many :engagements, through: :engagement_attendees
  has_many :created_engagements, class_name: "Engagement", foreign_key: "creator_id"
  has_many :notes, as: :notable, dependent: :destroy
  has_many :assets, as: :attachable
  has_many :report_submissions
  has_many :authored_notes, class_name: 'Note', foreign_key: 'author_id', inverse_of: :author
  before_save :set_site
  after_touch :set_last_engaged
  ROLE_ENUM = %W(student teacher staff apprentice volunteer parent alum DD CHIEF TFP)
  GRADE_ENUM = [6, 7, 8, 9, 10, 11, 12]
  SEX_ENUM = %w(M F)
  DREAM_TEAM_ENUM = [["Yep", true],["Nope", false]]
  COLOR_ENUM = %w(#42C8EE #036B89 #7c878a #419AD3 #568099)

  include Joinable
  include Activatable

  scope :q, -> (query) {
    return if query.blank?
    first = "%#{query.split(' ').first.downcase}%"
    last = "%#{query.split(' ').last.downcase}%"
    operator = first == last ? "or" : "and"
    name_matches = where("people.first_name like ? #{operator} people.last_name like ?", first, last)
      .order("people.dream_team DESC, people.first_name ASC")
    tag_matches = hashtagged(query)
    where("#{table_name}.id in (?)", (name_matches + tag_matches).map(&:id))
  }
  scope :logbook_default, -> { active }
  scope :with_hours, -> (kind="%") {
    joins(:engagements).where('engagements.kind like ?', kind).select("people.*, SUM(engagements.duration) AS engagement_hours").group('people.id')
  }
  scope :created_before, -> (date) { where(created_at: 100.years.ago..date.end_of_week) }
  scope :leading_projects, -> { joins(:project_people).where(project_people: {leading: true}).uniq }
  scope :just_supporting_projects, -> {
    joins(:project_people).where(project_people: {leading: false})
    .where('people.id NOT IN (SELECT (person_id) FROM project_people WHERE project_people.leading IS true)')
    .uniq
  }
  scope :field_staff, -> {
    where("role=? OR role=?", "DD", "CHIEF").order(:site_id, :first_name)
  }
  scope :ever_engaged, -> { where('last_engaged IS NOT NULL') }

  # These scopes are all used on Logbook Index table filters
  scope :by_first_name, -> (q) { where("first_name like ?", "%#{q.downcase}%") }
  scope :by_last_name, -> (q) { where("last_name like ?", "%#{q.downcase}%") }
  scope :by_role, -> (role) { where(role: role) }
  scope :by_grade, -> (grade) { where(grade: grade) }
  scope :by_dt, -> (dt=true) { where(dream_team: dt) }
  scope :by_ff, -> (ff=true) { where(future_fellow: ff) }
  scope :by_engagements_count, -> (count) { where("engagement_attendees_count >= ?", count) }
  scope :by_projects_count, -> (count) { where("project_people_count >= ?", count) }
  scope :by_notes_count, -> (count) { where("people.notes_count >= ?", count) }
  scope :by_engagement_dates, -> (t_start=StatCollector.default_range.first, t_end=StatCollector.default_range.last) {
    t_start = t_start.blank? ? StatCollector.default_range.first : Date.parse(t_start)
    t_end = t_end.blank? ? StatCollector.default_range.last : Date.parse(t_end)
    range = t_start..t_end
    joins(:engagements).merge(Engagement.btw(range)).uniq
  }
  scope :registered, -> { where(registered: true) }
  scope :unregistered, -> { where(registered: false) }
  # End Filter scopes
  include Hashtaggable
  hashtaggable_attribute :description

  def name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name.first}#{last_name.first}"
  end

  def dream_director
    school.try(:dream_director)
  end

  def logged_hours
    engagements.sum(:duration).to_i
  end

  def leads_project?(project)
    project.leaders.include? self
  end

  def school_name
    school.try(:name)
  end

  def set_site
    return if self.site || !self.school
    self.site_id = self.school.try(:site).try(:id)
    true
  end

  def set_last_engaged
    date = engagements.order('date DESC').where("date < ?", Date.tomorrow)
      .limit(1).first.try(:date)
    self.update(last_engaged: date)
    if self.first_engaged.nil?
      first = engagements.order('date').limit(1).first.try(:date)
      self.update first_engaged: date
    end
    true
  end

  def self.dedup ids
    duplicates = self.where(id: ids).order(:id)
    primary = duplicates.select{|p| p.identities.any? || p.dream_team }.first || duplicates.first
    primary.notes ||= ""
    count = duplicates.count
    duplicates = duplicates.where.not(id: primary.id).order(:id)
    puts "merging #{primary.name} with #{duplicates.count} other records..."
    duplicates.each do |p|
      primary.grade ||= p.grade
      primary.description ||= p.description
      primary.email ||= p.email
      primary.phone ||= p.phone
      p.engagement_attendees.each do |r|
        r.update_attributes person_id: primary.id
      end
      p.project_people.each do |r|
        r.update_attributes person_id: primary.id
      end
      p.notes.each do |r|
        r.update_attributes notable_id: primary.id
      end
      p.report_submissions.each do |r|
        r.update_attributes person_id: primary.id
      end
      p.assets.each do |r|
        r.update_attributes person_id: primary.id
      end
      p.assets.each do |r|
        r.update_attributes person_id: primary.id
      end
      p.authored_notes.each do |r|
        r.update_attributes author_id: primary.id
      end
      p.identities.each do |r|
        r.update_attributes person_id: primary.id
      end
      p.created_people.each do |r|
        r.update_attributes creator_id: primary.id
      end
      p.created_engagements.each do |r|
        r.update_attributes creator_id: primary.id
      end
      p.destroy
    end
    puts "merged #{count} people into #{primary.name}, id #{primary.id}"
    primary.save
    primary.touch
  end

  # rewrite in SQL
  def self.meaningfully_engaged(scope=self.all)
    (scope.joins(:engagements) + scope.joins(:projects)).flatten.uniq
  end


  # user methods
  def default_logbook_scope
    if school
      school
    elsif site
      site
    else
      National.new
    end
  end

  def sites
    if site
      Site.where(id: site.id)
    else
      Site.order(:name)
    end
  end

  def schools
    if site
      site.schools.order(:name)
    else
      School.order(:name)
    end
  end

  # give a person Level 2 Clearance if they have a futureproject.org email
  def set_clearance_by_email(address=self.email)
    return unless address.end_with?("@thefutureproject.org")
    if clearance_level > 2
      self.update registered: true
    else
      self.update clearance_level: 2, registered: true
    end
  end

  # collect all notes on this person directly, their engagements, and their projects
  def collected_notes
    e = engagements.coaching_sessions.joins(:notes).uniq.pluck("notes.id")
    p = projects.joins(:notes).uniq.pluck("notes.id")
    n = notes.pluck(:id)
    Note.where(id: (e+p+n).flatten.uniq).order("created_at DESC")
  end

  def location_string
    if school
      school.name
    elsif site
      site.name
    else
      "National"
    end
  end

  rails_admin do
    list do
      sort_by :first_name
    end
    edit do
      field :first_name
      field :last_name
      field :email
      field :role, :enum do
        enum do
          Person::ROLE_ENUM
        end
      end
      field :clearance_level
      field :school
      field :grade
      field :dream_team
      field :sex, :enum do
        enum do
          Person::SEX_ENUM
        end
      end
      field :phone
    end
  end

end
