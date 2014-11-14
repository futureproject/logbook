class Phonebook.Controllers.AppController extends Backbone.View
  initialize: ->
    @render()
  render: ->
    @$el.html @template()
    @

  template: JST['phonebook/templates/app']
