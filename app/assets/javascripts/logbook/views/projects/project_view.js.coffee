dream.Views.Projects ||= {}

class dream.Views.Projects.ProjectView extends Backbone.View
  initialize: (args) ->
    @model = args.model
    @listenTo @model, 'change:name', @render
    @listenTo @model, 'destroy', @remove
    @listenTo Backbone, 'project:show', @addActiveClass

  template: JST['logbook/templates/projects/project']

  className: 'list-item'

  events:
    'click': 'select'

  select: (e) ->
    return if @el.classList.contains 'is_active'
    Backbone.trigger 'project:show', @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    return @

  remove: -> @$el.remove()

  addActiveClass: (person) ->
    return unless person == @model
    $('.list-item.is_active').removeClass('is_active')
    @el.classList.add('is_active')
