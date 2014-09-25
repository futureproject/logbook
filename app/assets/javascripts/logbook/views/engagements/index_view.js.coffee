dream.Views.Engagements ||= {}

class dream.Views.Engagements.IndexView extends Backbone.View
  initialize: () ->
    @listenTo Backbone, 'engagements:changed', @display

  events:
    'click .new': 'new'
    'click .refresh': 'refresh'

  display: (collection) ->
    @collection = collection
    @render()

  template: JST['logbook/templates/engagements/index']

  render: () ->
    @$el.html @template()
    @$list = @$el.find('.list-body')
    frag = document.createDocumentFragment()
    @collection?.each (engagement) =>
      view = new dream.Views.Engagements.EngagementView
        model: engagement
      frag.appendChild view.render().el
    @$list.html(frag)
    return this

  new: (e) ->
    e.preventDefault()
    Backbone.trigger 'engagement:new', @collection

  refresh: (e) ->
    e.preventDefault()
    @collection?.refresh()

