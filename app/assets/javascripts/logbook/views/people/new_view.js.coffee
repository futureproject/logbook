dream.Views.People ||= {}

class dream.Views.People.NewView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'person:new', @display
    @listenTo Backbone, 'person:selected', @hide

  className: 'panel list-detail'
  template: JST['logbook/templates/people/new']

  events:
    'click .cancel': 'cancel'
    'submit': 'done'

  display: (collection) ->
    @collection = collection
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
    history.back() if history.length > 1

  done: (e) ->
    e.preventDefault()
    data = Backbone.Syphon.serialize @
    @collection.add @model
    @model.save data,
      success : (person) =>
        @model.select()
        @hide()
      errer: (e) =>
        console.log e
