Phonebook.Views.People ||= {}

class Phonebook.Views.People.SelectablePersonView extends Phonebook.Views.Base.RowView
  initialize: ->
    @listen()
    super

  listen: ->
    @listenTo @model, 'change', @render
    @listenTo @, 'tapped', @toggle

  template: JST['phonebook/templates/people/selectable_person']

  toggle: (e) ->
    if @model.has('selected')
      @model.set('selected', null)
    else
      @model.set('selected', true)
      Backbone.trigger 'result:selected', @model, e

  render: ->
    @$el.html(@template @model.tplAttrs()).attr('class', @className())
    @

  broadcastClick: (event) ->
    console.log event

