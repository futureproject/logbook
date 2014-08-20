dream.Views.People ||= {}

class dream.Views.People.ShowView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'person:show', @display
    @listenTo Backbone, 'person:destroy', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/people/show']

  events:
    'click .edit': (e) ->
      e.preventDefault()
      Backbone.trigger 'person:edit', @model
    'blur textarea': 'saveNotes'

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'router:update', "logbook/people/#{@model.get('id')}"

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    @updateCounts()
    return @

  updateCounts: ->
    Backbone.trigger 'projects:findByLeaderId', @model.get('id'), (projects) =>
      $('#primary_projects_count').text(projects.length)
    Backbone.trigger 'projects:findByParticipantId', @model.get('id'), (projects) =>
      $('#secondary_projects_count').text(projects.length)
    Backbone.trigger 'workshops:findByAttendeeId', @model.get('id'), (workshops) =>
      $('#workshops_attended_count').text(workshops.length)

  hide: ->
    @$el.hide()

  saveNotes: (e) ->
    @model.save
      notes: $(e.currentTarget).val()
