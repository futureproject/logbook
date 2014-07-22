dream.Views.Workshops ||= {}
class dream.Views.Workshops.FormView extends Backbone.View
  initialize: ->
    $('#workshop_attendee_ids').selectize()

