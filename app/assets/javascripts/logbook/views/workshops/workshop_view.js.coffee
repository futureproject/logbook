dream.Views.Workshops ||= {}

class dream.Views.Workshops.WorkshopView extends Backbone.View
  initialize: (args) ->
    @model = args.model
    @listenTo @model, 'change:date change:kind', @render
    @listenTo @model, 'destroy', @remove
    @listenTo Backbone, 'workshop:show', @addActiveClass

  template: JST['logbook/templates/workshops/workshop']

  className: 'list-item'

  events:
    'click': 'select'

  select: (e) ->
    return if @el.classList.contains 'is_active'
    Backbone.trigger 'workshop:show', @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    return @

  remove: -> @$el.remove()

  addActiveClass: (person) ->
    return unless person == @model
    $('.list-item.is_active').removeClass('is_active')
    @el.classList.add('is_active')
