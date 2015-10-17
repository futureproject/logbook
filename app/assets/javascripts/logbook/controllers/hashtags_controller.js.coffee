class ds.HashtagsController extends ds.BaseController
  initialize: ->
    @namespace = "hashtags"
    @views = {}
    @actions()
    @listenTo Backbone, "controller:activated", @cleanup
    @listenTo Backbone, "routed", @routeListener
    @routeListener()

  targetEl: "#yield"

  actions: ->
    @listenTo Backbone, "hashtags:view", @show

  show: (tag) ->
    tag = @setTagFromName tag
    @views.show = new ds.HashtagsShowView
      model: tag
    @views.show.renderTo @targetEl

  setTagFromName: (name) ->
    @activate()
    tag = new ds.Hashtag({name: name})
    tag.fetch()
    tag

