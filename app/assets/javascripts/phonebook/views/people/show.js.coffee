class ds.PersonShowView extends Backbone.View
  className: 'screen animation-fallin people-show'
  initialize: ->
    @views =
      profile: new ds.PersonProfileView
        model: @model
        template: JST["phonebook/templates/people/_profile"]
      #projects: new ds.People_ProjectsView
        #model: @model
      engagements: new ds.PersonEngagementsView
        model: @model

  template: JST["phonebook/templates/people/show"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    @views.profile.renderTo "#person-profile"
    @views.engagements.renderTo "#person-engagements"
    #@views.projects.renderTo "#person-projects"

  events:
    'touchstart .button': (e) ->
    'click .back': 'back'
    'click .edit': 'edit'

  back: -> Backbone.trigger "people:action", "index"

  edit: -> Backbone.trigger "people:action", "edit", @model.id

