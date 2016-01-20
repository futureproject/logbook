class ds.PeopleEditView extends Backbone.View
  className: 'screen animation-fallin'
  initialize: ->
    @listenTo @model, 'change', @render

  template: JST["phonebook/templates/people/edit"]

  events:
    'touchstart .button': (e) ->
    'submit': 'onsubmit'
    'click .cancel': 'cancel'
    'click .done': (e) -> @$el.find('form').submit()

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    Backbone.Syphon.deserialize @, @model.toJSON()

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    if @model.save data
      Backbone.trigger "people:action", "show", @model.id
      Backbone.trigger "notification", "Person updated!"
    else
      alert @model.validationError

  cancel: ->
    Backbone.trigger "people:action", "show", @model.id
