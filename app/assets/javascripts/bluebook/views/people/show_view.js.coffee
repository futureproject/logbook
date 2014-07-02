Bluebook.Views.People ||= {}

class Bluebook.Views.People.ShowView extends Backbone.View
  template: JST["bluebook/templates/people/show"]

  initialize: ->
    @listenTo Backbone, 'people:show', @show

  events:
    'change input' : 'toggleCore'
    'click .edit' : -> Backbone.trigger 'people:edit', @model

  show: (model) ->
    @model = model
    Backbone.trigger 'route:go', "/bluebook/people/#{@model.get('id')}"
    @render()

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this

  toggleCore: ->
    @model.set("core", !@model.get('core'))
    @model.save()

