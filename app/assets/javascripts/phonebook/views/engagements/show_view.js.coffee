Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.ShowView extends Backbone.View
  initialize: (args) ->
    @model ||= new Phonebook.Models.Engagement
    @listen()

  template: JST['phonebook/templates/engagements/show']

  # hide when model is unselected
  events:
    'tap': 'hide'

  listen: ->
    @listenTo Backbone, 'people:selected', @onSelect

  onSelect: (model, view) ->
    @model = model
    @render()
    if view
      @originalPosition = view.el.getBoundingClientRect()
      @$el.transition({x: @originalPosition.left, y: @originalPosition.top, duration: 0 })
      @el.classList.add 'active'
      @$el.transition({x: @originalPosition.left, y: 0, opacity: 1 })
# animate me

  hide: ->
    console.log @originalPosition
    @originalPosition ||= { top: '100%', left: 0 }
    @$el.transition
      x: @originalPosition.left
      y: @originalPosition.top
      opacity: 0
      complete: =>
        @$el.removeClass('active')

  render: ->
    @$el.html @template @model.toJSON()
    @

