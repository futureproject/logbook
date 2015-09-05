class ds.PeopleShowView extends Backbone.View
  initialize: ->
    @views =
      facts: new ds.ModelView
        model: @model
        template: JST["phonebook/templates/people/_facts"]

  template: JST["phonebook/templates/people/show"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.facts.renderTo "#person-facts"

  events:
    'tap .back': 'back'

  back: -> Backbone.trigger "people:do", "index"

