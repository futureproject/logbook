dream.Views.Stats ||= {}

class dream.Views.Stats.IndexView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'stats:changed', @display

  events:
    'click .refresh' : 'refresh'

  display: (collection) ->
    @collection = collection
    @render()

  template: JST['logbook/templates/stats/index']

  render: () ->
    @$el.html @template()
    @$list = @$el.find('table')
    frag = document.createDocumentFragment()
    @collection?.each (project) =>
      view = new dream.Views.Stats.StatView
        model: project
      frag.appendChild view.render().el
    @$list.append(frag)
    return this

  refresh: (e) ->
    e.preventDefault()
    @collection.refresh()

