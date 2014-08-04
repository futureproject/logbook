class dream.Views.People.PersonView extends Backbone.View
  initialize: (args) ->
    @model = args.model
    @listenTo @model, 'change:first_name change:last_name', @render
    @listenTo @model, 'destroy', @remove
    @listenTo Backbone, 'person:show', @addActiveClass

  template: JST['logbook/templates/people/person']

  className: 'list-item'

  events:
    'click': 'select'

  select: (e) ->
    return if @el.classList.contains 'is_active'
    Backbone.trigger 'person:show', @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    return @

  remove: -> @$el.remove()

  addActiveClass: (person) ->
    return unless person == @model
    $('.list-item.is_active').removeClass('is_active')
    @el.classList.add('is_active')
