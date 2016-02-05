class ds.PeopleIndexView extends Backbone.View
  className:->
    cls = 'index people people-index screen animation-fallin'
    #cls += " animation-fallin" if ds.APP_LOADED
    cls

  template: JST["phonebook/templates/people/index"]
  initialize: (options = {}) ->
    @[option] = options[option] for option of options
    @views =
      list: new ds.PeopleListView
        collection: @collection
      search: new ds.PeopleSearchView
        collection: @collection
    @listen()

  events:
    'click .hamburger': 'showNav'
    'click .sync': (e) -> Backbone.trigger "people:sync"
    'touchstart .titlebar': (e) ->

  render: ->
    @$el.html @template()
    @postRender()
    @

  postRender: ->
    @views.list.renderTo "#people-list", { replace: true }
    @views.search.renderTo "#people-search", { replace: true }

  listen: ->
    @listenTo Backbone, 'people:search:in', =>
      @$el.find('.titlebar').animate({height:0},'fast').addClass('hidden')
    @listenTo Backbone, 'people:search:out', =>
      @$el.find('.titlebar').animate({height: 45},'fast').removeClass('hidden')
    @listenTo @collection, "sync:started", @spin
    @listenTo @collection, "sync:ended", @despin

  spin: ->
    @$el.addClass('syncing')

  despin: ->
    @$el.removeClass('syncing')

  showNav: (event) -> Backbone.trigger "app:nav"
