dream.Views.Engagements ||= {}
class dream.Views.Engagements.FormView extends Backbone.View
  initialize: ->
    $('#engagement_attendee_ids').selectize()

