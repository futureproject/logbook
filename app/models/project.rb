class Project < ActiveRecord::Base
  validates_presence_of :name, :school_id
  belongs_to :school
  has_many :project_participants, dependent: :destroy
  has_many :project_leaders, dependent: :destroy
  has_many :leaders, through: :project_leaders, source: :person
  has_many :participants, through: :project_participants, source: :person
  has_many :assets, as: :attachable, dependent: :destroy
  has_many :student_reflections, class_name: "Reflection", as: :reflectable
  after_create :log_action

  def log_action
    Action.create(
      who: school.try(:name),
      what: "started a project",
      subject_id: id,
      subject_type: "Project",
      interesting: true,
      school_id: school.try(:id)
    )
  end

  def whole_team
    (leaders + participants).flatten.uniq
  end

end
