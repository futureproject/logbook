class ds.PeopleAddEngagementView extends Backbone.View
  className: 'screen animation-fallin add-engagement'
  template: JST["phonebook/templates/people/add_engagement"]
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @listen()

  events:
    'touchstart .button': (e) ->
    'submit': 'onsubmit'
    'click .cancel': 'cancel'
    'click .done': (e) -> @$el.find('form').submit()

  listen: ->
    @listenTo @person, 'change', @render

  tplAttrs: ->
    _.extend @person.tplAttrs(), @model.tplAttrs()

  render: ->
    @$el.html @template(@tplAttrs())
    @postRender()
    @

  postRender: ->
    Backbone.Syphon.deserialize @, @model.toJSON()

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    if @model.save data
      @person.collections.engagements.add @model
      Backbone.trigger "engagements:persist", @model
      Backbone.trigger "people:do", "show", @person.id
      Backbone.trigger "notification", "Engagement Added!"
    else
      alert @model.validationError

  cancel: ->
    Backbone.trigger "people:do", "show", @person.id

