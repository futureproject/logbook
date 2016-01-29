class ds.EngagementShowView extends Backbone.View
  className: 'screen animation-fallin engagements-show'
  initialize: ->
    Backbone.trigger "engagements:showing", @model

  template: JST["phonebook/templates/engagements/show"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @postRender()
    @

  postRender: ->
    #@views.profile.renderTo "#engagement-profile"
    #@views.engagements.renderTo "#engagement-engagements"
    #@views.projects.renderTo "#engagement-projects"

  events:
    'touchstart .button': (e) ->
    'click .back': 'back'
    'click .edit': 'edit'

  back: -> Backbone.trigger "engagements:action", "index"

  edit: -> Backbone.trigger "engagements:action", "edit", @model.id

