dream.Views.People ||= {}

class dream.Views.People.NewView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'person:new', @display
    @listenTo Backbone, 'person:show', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/people/new']

  events:
    'click .cancel': 'cancel'
    'submit': 'done'

  display: ->
    return if @$el.is(':visible')
    @model = new dream.Models.Person
    @render()
    Backbone.Syphon.deserialize @, @model.attributes
    Backbone.trigger 'router:update', "logbook/people/new"

  hide: -> @$el.hide()

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @

  cancel: (e) ->
    e.preventDefault()
    @hide()
    Backbone.trigger 'router:update', 'logbook/people'

  done: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize @
    @model.save data,
      success : (person) =>
        Backbone.trigger 'person:created', @model
        Backbone.trigger 'person:show', @model
      error: (e) =>
        console.log e
