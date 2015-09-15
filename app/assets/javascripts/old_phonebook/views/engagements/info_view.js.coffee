Phonebook.Views.Engagements ||= {}

class Phonebook.Views.Engagements.InfoView extends Backbone.View
  initialize: ->
    @listenTo @model, 'change', @render
  template: JST['phonebook/templates/engagements/info']
  render: ->
    @$el.html(@template @model.tplAttrs())
