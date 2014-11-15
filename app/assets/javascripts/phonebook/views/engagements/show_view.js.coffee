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

  onSelect: (model) ->
    @model = model
    @render()
    @$el.addClass('active').animateCSS('zoomIn')

  hide: ->
    @$el.animateCSS('zoomOut', -> $(this).removeClass('active'))
    #@$el.hide()

  render: ->
    @$el.html @template @model.toJSON()
    @
