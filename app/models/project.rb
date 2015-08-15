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

  scope :q, -> (query) { where("projects.name like ?", "%#{query.downcase}%") }

  scope :with_association, -> (table) {
    joins(table.to_sym)
    .select("projects.*, COUNT(#{table}.id) AS #{table}_count")
    .group('projects.id')
  }

  scope :conditionally_joined, -> (params, stat_times) {
    if params[:sort_by] == "notes_count"
      with_association(:notes).merge(btw(stat_times))
    elsif params[:sort_by] == "people_count"
      with_association(:people).merge(btw(stat_times))
    else
      btw(stat_times)
    end
  }

  scope :btw, -> (range) { where(updated_at: range) }
end
