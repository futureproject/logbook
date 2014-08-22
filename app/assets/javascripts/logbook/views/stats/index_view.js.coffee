dream.Views.Stats ||= {}

class dream.Views.Stats.IndexView extends Backbone.View
  initialize: (args) ->
    @listenTo Backbone, 'stats:changed', @display

  events:
    'click .refresh' : 'refresh'
    'click .update' : 'update'

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

  update: ->
    return unless navigator.onLine
    if applicationCache.status == 4
      if confirm("There's a new version available. Would you like to update now?")
        applicationCache.swapCache()
        location.reload()
    else
      alert "You're up to date!"

    #_.each dream.presenter.presenters, (pres) ->
    #  pres.collection.fetch
    #    reset: true,
    #    remote: true
    #    success: =>
    #      fetches += 1
    #      if fetches == _.size dream.presenter.presenters
    #        try
    #          applicationcache.swapcache()
    #          location.reload()
    #        catch
    #          # nothing
