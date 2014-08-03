dream.Views.People ||= {}

class dream.Views.People.IndexView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'peopleCollection:changed', @display

  events:
    'click .new': 'new'

  display: (collection) ->
    @collection = collection
    @render()

  template: JST['logbook/templates/people/index']

  render: () ->
    @$el.html @template()
    @$list = @$el.find('.list-body')
    frag = document.createDocumentFragment()
    @collection?.each (person) =>
      view = new dream.Views.People.PersonView
        model: person
      frag.appendChild view.render().el
    @$list.html(frag)
    return this

  new: (e) ->
    e.preventDefault()
    Backbone.trigger 'person:new', @collection
