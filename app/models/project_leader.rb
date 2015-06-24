class ProjectLeader < ActiveRecord::Base
  belongs_to :project, touch: true
  belongs_to :person, touch: true
  validates_presence_of :person_id
  validates_uniqueness_of :person_id, scope: :project_id, allow_nil: true

end
