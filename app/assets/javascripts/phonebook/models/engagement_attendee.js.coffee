# This is a Join Model for saving project_people
class ds.EngagementAttendee extends Backbone.Model
  defaults:
    person_id: null
    engagement_id: null

class ds.EngagementAttendeesCollection extends Backbone.Collection
  model: ds.EngagementAttendee
