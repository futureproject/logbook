dream.Views.Projects ||= {}

class dream.Views.Projects.NewView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'project:new', @display
    @listenTo Backbone, 'project:show', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/projects/new']

  events:
    'click .cancel': 'cancel'
    'submit': 'done'

  display: () ->
    return if @$el.is(':visible')
    @model = new dream.Models.Project
    @render()
    Backbone.trigger 'router:update', "logbook/projects/new"
    @listenToOnce Backbone, 'peopleCollection:changed', (collection) =>
      $('select').selectize
        options: collection.models.map (model) -> model.selectizeAttrs()
        valueField: 'id'
        labelField: 'name'
        plugins: ['fast-click']
        searchField: ['first_name', 'last_name']
        sortField: [
          {"field": "dream_team", "direction": "desc"},
          {"field": "first_name", "direction": "asc"},
        ]
    Backbone.trigger 'people:bootstrap'

  hide: -> @$el.hide()

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @

  cancel: (e) ->
    e.preventDefault()
    @hide()
    Backbone.trigger 'router:update', 'logbook/projects'

  done: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize @
    data.leader_ids = [''] if data.leader_ids == null
    data.participant_ids = [''] if data.participant_ids == null
    @model.save data,
      success : (project) =>
        Backbone.trigger 'project:created', @model
        Backbone.trigger 'project:show', @model
      error: (e) =>
        console.log e
