class ds.PeopleShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
  template: JST["phonebook/templates/people/show"]
  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->

  events:
    'tap .back': 'back'

  back: -> Backbone.trigger "people:do", "index"

