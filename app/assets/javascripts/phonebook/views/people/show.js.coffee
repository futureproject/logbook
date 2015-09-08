class ds.PeopleShowView extends Backbone.View
  initialize: ->
    @views =
      facts: new ds.ModelView
        model: @model
        template: JST["phonebook/templates/people/_facts"]
      projects: new ds.People_ProjectsView
        model: @model
      engagements: new ds.People_EngagementsView
        model: @model

  template: JST["phonebook/templates/people/show"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    Backbone.trigger 'scroll:reset', 0
    @views.facts.renderTo "#person-facts"
    @views.projects.renderTo "#person-projects"
    @views.engagements.renderTo "#person-engagements"

  events:
    'click .back': 'back'

  back: -> Backbone.trigger "people:do", "index"

