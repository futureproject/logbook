class Project < ActiveRecord::Base
  validates_presence_of :name, :school_id
  belongs_to :school, touch: true
  has_many :project_people, dependent: :destroy
  has_many :people, through: :project_people
  has_many :leaders, -> { where(project_people: {leading: true}) }, through: :project_people, source: :person
  has_many :supporters, -> { where(project_people: {leading: false}) }, through: :project_people, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  has_many :notes, as: :notable, dependent: :destroy
  COLOR_ENUM = %w(#419AD3 #568099 #064974 #FFAC43 #B66500 #FFEDD6)
  STATUS_ENUM = %w(underway stalled complete)
  include Sortable

  scope :user_sort, -> (column) { order column.to_s }

  scope :q, -> (query) { where("lower(projects.name) like ?", "%#{query.downcase}%") }

  scope :with_people, -> (kind='leaders') {
    joins(kind.to_sym).select("projects.*, COUNT(people.id) AS people_count").group('projects.id')
  }

  scope :with_association, -> (table) {
    joins(table.to_sym).select("projects.*, COUNT(#{table}.id) AS #{table}_count").group('projects.id')
  }

  scope :with_updates, -> { where('updated_at > created_at') }
  scope :btw, -> (range) { where(created_at: range) }

  def whole_team
    (leaders + supporters).flatten.uniq
  end

end
