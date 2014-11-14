Phonebook.Views.People ||= {}

class Phonebook.Views.People.ShowView extends Backbone.View
  template: JST["phonebook/templates/people/show"]

  initialize: ->
    @listenTo Backbone, 'people:show', @show

  events:
    'change #toggle_core' : 'toggleCore'
    'click .edit' : -> Backbone.trigger 'people:edit', @model
    'touchstart': 'onScrollStart'
    'touchmove': 'onScrollMove'

  onScrollStart: (e) ->
    console.log @el
    height = @el.getBoundingClientRect().height
    atTop = @el.scrollTop == 0
    atBottom = (@el.scrollHeight - @el.scrollTop == height)
    if atTop
      @el.scrollTop += 1
    else if atBottom
      @el.scrollTop -= 1

  onScrollMove: (e) ->
    e.stopPropagation()

  show: (model) ->
    @model = model
    Backbone.trigger 'peopleRouter:go', "/phonebook/people/#{@model.get('id')}"
    @render()

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this

  toggleCore: ->
    @model.set("core", !@model.get('core'))
    @model.save()

