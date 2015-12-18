class ProjectEngagementLink < ActiveRecord::Base
  belongs_to :engagement, touch: true
  belongs_to :project, touch: true
  validates_presence_of :project_id
  validates_uniqueness_of :project_id, scope: :engagement_id, allow_nil: true
end
