dream.Views.People ||= {}

class dream.Views.People.ShowView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'person:selected', @display

  className: 'panel list-detail'
  template: JST['logbook/templates/people/show']

  events:
    'click .edit': (e) ->
      e.preventDefault()
      Backbone.trigger 'person:edit', @model

  display: (model) ->
    @model = model
    @render()
    Backbone.trigger 'router:update', "logbook/people/#{@model.get('id')}"

  render: ->
    @$el.html( @template @model.toJSON() ).show()
    return @
