class Project < ActiveRecord::Base
  validates_presence_of :name, :school_id
  belongs_to :school
  has_many :project_participants
  has_many :project_leaders
  has_many :leaders, through: :project_leaders, source: :person
  has_many :participants, through: :project_participants, source: :person
  after_create :log_action

  def log_action
    Action.create(
      who: leaders.limit(3).pluck(:first_name).join(", "),
      what: "started a project",
      subject_id: id,
      subject_type: "Project",
      interesting: true,
      school_id: school.try(:id)
    )
  end
end
