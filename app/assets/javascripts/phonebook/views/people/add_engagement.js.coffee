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
    attrs = @model.toJSON()
    # render duration as minutes
    attrs.duration = attrs.duration * 60
    console.log attrs
    Backbone.Syphon.deserialize @, attrs

  onsubmit: (event) ->
    event.preventDefault()
    data = Backbone.Syphon.serialize @
    # convert minutes back to hours
    duration = parseFloat(data.duration/60).toFixed(3)
    data.duration = duration
    if @model.save data
      @person.collections.engagements.add @model
      Backbone.trigger "engagements:persist", @model
      Backbone.trigger "people:do", "show", @person.id
      Backbone.trigger "notification", "Engagement Added!"
    else
      alert @model.validationError

  cancel: ->
    Backbone.trigger "people:do", "show", @person.id

