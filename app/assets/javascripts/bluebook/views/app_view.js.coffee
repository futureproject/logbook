class Bluebook.Views.AppView extends Backbone.View
  render: ->
    @$el.html(@template())
    @

  template: JST['bluebook/templates/app']
