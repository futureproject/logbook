class Project < ActiveRecord::Base
  validates_presence_of :name, :school_id
  belongs_to :school, touch: true
  has_many :project_participants, dependent: :destroy
  has_many :project_leaders, dependent: :destroy
  has_many :leaders, through: :project_leaders, source: :person
  has_many :participants, through: :project_participants, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  has_many :student_reflections, class_name: "Reflection", as: :reflectable
  after_create :log_activity
  has_many :activities, as: :thing, dependent: :destroy
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

  def log_activity
    Activity.create(
      actor_id: leaders.first.try(:id),
      actor_type: leaders.first.try(:class).try(:name),
      thing_id: id,
      thing_type: self.class.name,
      school_id: self.school_id,
      feed_date: self.created_at
    )
  end

  def whole_team
    (leaders + participants).flatten.uniq
  end

  def self.as_bubbles(scope=self.all)
    scope.group_by(&:status).map{|k,v| { name: k, data: v.map{|e| { x: e.created_at.to_datetime.to_i*1000, y: e.whole_team.count, z: e.whole_team.count, title: e.name, id: e.id, description: e.description.try(:first, 44) } } } }
  end

end
