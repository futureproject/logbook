class Project < ActiveRecord::Base
  validates_presence_of :name, :school_id
  belongs_to :school
  has_many :project_participants
  has_many :project_leaders
  has_many :leaders, through: :project_leaders, source: :person
  has_many :participants, through: :project_participants, source: :person
end
