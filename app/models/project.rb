class Project < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :school, touch: true
  has_many :project_people, dependent: :destroy
  has_many :people, through: :project_people
  has_many :leaders, -> { where(project_people: {leading: true}) }, through: :project_people, source: :person
  has_many :supporters, -> { where(project_people: {leading: false}) }, through: :project_people, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  has_many :notes, as: :notable, dependent: :destroy
  has_many :project_engagement_links
  has_many :engagements, through: :project_engagement_links
  COLOR_ENUM = %w(#419AD3 #568099 #064974 #FFAC43 #B66500 #FFEDD6)
  STATUS_ENUM = %w(underway stalled complete)

  include Joinable
  # These scopes are all used on Logbook Index table filters
  scope :by_status, -> (status) { where(status: status) }
  scope :by_team_size, -> (count) { where("projects.project_people_count>=?", count) }
  scope :by_notes_count, -> (count) { where("projects.notes_count >= ?", count) }
  scope :by_created_at, -> (date) { where("created_at>=?", date) }
  scope :by_updated_at, -> (date) { where("created_at>=?", date) }
  scope :q, -> (query) {
    name_matches = where("projects.name like ?", "%#{query.downcase}%")
    tag_matches = hashtagged(query)
    where("#{table_name}.id in (?)", (name_matches + tag_matches).map(&:id))
  }
  include Hashtaggable
  hashtaggable_attribute :description

end
