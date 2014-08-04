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
    Backbone.Syphon.deserialize @, @model.attributes
    Backbone.trigger 'router:update', "logbook/projects/#{@model.get('id')}/edit"

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
    @model.save data,
      success : (project) =>
        Backbone.trigger 'project:show', @model
