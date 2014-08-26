dream.Views.Projects ||= {}

class dream.Views.Projects.EditView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'project:edit', @display
    @listenTo Backbone, 'project:show', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/projects/edit']

  events:
    'click .cancel': 'cancel'
    'click .warning': 'delete'
    'submit': 'done'

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'router:update', "logbook/projects/#{@model.get('id')}/edit"
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
      Backbone.Syphon.deserialize @, @model.attributes
      $('option[selected]').attr('selected', 'selected')
    Backbone.trigger 'people:bootstrap'

  hide: -> @$el.hide()

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @

  cancel: (e) ->
    e.preventDefault()
    @hide()
    Backbone.trigger 'project:show', @model

  delete: (e) ->
    return unless confirm("Do you really want to delete this project?")
    Backbone.trigger 'project:destroy', @model
    @hide()

  done: (e) ->
    e.preventDefault()
    @hide()
    data = Backbone.Syphon.serialize @
    data.leader_ids = [''] if data.leader_ids == null
    data.participant_ids = [''] if data.participant_ids == null
    @model.save data,
      success : (project) =>
        Backbone.trigger 'project:show', @model

