dream.Views.People ||= {}

class dream.Views.People.EditView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'person:edit', @display
    @listenTo Backbone, 'person:selected', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/people/edit']

  events:
    'click .cancel': 'cancel'
    'submit': 'done'

  display: (model) ->
    @model = model
    @render()
    Backbone.Syphon.deserialize @, @model.attributes
    Backbone.trigger 'router:update', "logbook/people/#{@model.get('id')}/edit"

  hide: -> @$el.hide()

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @

  cancel: (e) ->
    e.preventDefault()
    @hide()
    Backbone.trigger 'person:selected', @model

  done: (e) ->
    e.preventDefault()
    @hide()
    data = Backbone.Syphon.serialize @
    @model.save data,
      success : (person) =>
        Backbone.trigger 'person:selected', @model
