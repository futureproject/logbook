dream.Views.Projects ||= {}

class dream.Views.Projects.ShowView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'project:show', @display
    @listenTo Backbone, 'project:destroy', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/projects/show']

  events:
    'click .edit': (e) ->
      e.preventDefault()
      Backbone.trigger 'project:edit', @model

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'people:getSome',
      ids: @model.get('leader_ids')
      callback: @addLeaders

    Backbone.trigger 'people:getSome',
      ids: @model.get('participant_ids')
      callback: @addParticipants

    Backbone.trigger 'router:update', "logbook/projects/#{@model.get('id')}"

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @

  hide: ->
    @$el.hide()

  addLeaders: (people) ->
    $('#project_leaders').append("<li>#{person.get('first_name')}</li>") for person in people

  addParticipants: (people) ->
    $('#project_participants').append("<li>#{person.get('first_name')}</li>") for person in people
