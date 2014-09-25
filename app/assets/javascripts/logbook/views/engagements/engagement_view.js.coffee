dream.Views.Engagements ||= {}

class dream.Views.Engagements.EngagementView extends Backbone.View
  initialize: (args) ->
    @model = args.model
    @listenTo @model, 'change:date change:kind', @render
    @listenTo @model, 'destroy', @remove
    @listenTo Backbone, 'engagement:show', @addActiveClass

  template: JST['logbook/templates/engagements/engagement']

  className: 'list-item'

  events:
    'click': 'select'

  select: (e) ->
    return if @el.classList.contains 'is_active'
    Backbone.trigger 'engagement:show', @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    return @

  remove: -> @$el.remove()

  addActiveClass: (person) ->
    return unless person == @model
    $('.list-item.is_active').removeClass('is_active')
    @el.classList.add('is_active')
