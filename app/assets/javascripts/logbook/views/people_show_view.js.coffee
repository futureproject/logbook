class ds.PeopleShowView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
    @views = {}

  template: JST['logbook/templates/people_show']

  className: 'person profile'

  render: ->
    console.log 'rendered show view'
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->

