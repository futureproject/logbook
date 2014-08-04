class dream.Views.People.PersonView extends Backbone.View
  initialize: (args) ->
    @model = args.model
    @listenTo @model, 'change:selected change:first_name change:last_name', @render
    @listenTo @model, 'destroy', @remove
    @listenTo Backbone, 'person:show', @addActiveClass

  template: JST['logbook/templates/people/person']

  className: 'list-item'

  events:
    'click': 'select'

  select: ->
    Backbone.trigger 'person:show', @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    return @

  remove: -> @$el.remove()

  addActiveClass: (person) ->
    return unless person == @model
    $('.list-item.is_active').removeClass('is_active')
    @$el.addClass('is_active')
