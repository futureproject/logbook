class dream.PeoplePresenter extends Backbone.View
  el: '#logbook_people'

  initialize: (args) ->
    @render()
    @tab = new dream.Views.App.TabView
      presenter: @
      parentEl: '#sidebar .tabs'
      icon: 'organization'
      label: 'People'
      url: 'logbook/people'
    @initCollection()
    @initViews()
    @listen()

  listen: ->
    @listenTo Backbone, 'people:present', @present
    @listenTo Backbone, 'people:routeTo', @routeTo

  initCollection: ->
    @collection = new dream.Collections.People

  render: ->
    @$el.html("
      <div id='logbook_people_index'></div>
      <div id='logbook_people_detail'></div>
    ")

  present: (view, args) ->
    @collection.fetch()
    @$el.show().siblings().hide()
    Backbone.trigger 'presenter:presenting', @
    Backbone.trigger('router:update', args.url) if args?.url?

  initViews: ->
    @index = new dream.Views.People.IndexView
      el: '#logbook_people_index'
      collection: @collection

    @show = new dream.Views.People.ShowView
      el: '#logbook_people_detail'

  routeTo: (action, id) ->
    @present()
    @routerActions[action]?.call(@)

  routerActions:
    index: ->
    show: ->

