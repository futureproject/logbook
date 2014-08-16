dream.Views.Workshops ||= {}

class dream.Views.Workshops.IndexView extends Backbone.View
  initialize: () ->
    @listenTo Backbone, 'workshops:changed', @display

  events:
    'click .new': 'new'
    'click .refresh': 'refresh'

  display: (collection) ->
    @collection = collection
    @render()

  template: JST['logbook/templates/workshops/index']

  render: () ->
    @$el.html @template()
    @$list = @$el.find('.list-body')
    frag = document.createDocumentFragment()
    @collection?.each (workshop) =>
      view = new dream.Views.Workshops.WorkshopView
        model: workshop
      frag.appendChild view.render().el
    @$list.html(frag)
    return this

  new: (e) ->
    e.preventDefault()
    Backbone.trigger 'workshop:new', @collection

  refresh: (e) ->
    e.preventDefault()
    @collection?.refresh()

