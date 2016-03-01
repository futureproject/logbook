class ds.AssetsController extends ds.BaseController
  el: "#gallery-nav-item"
  targetEl: "#yield"
  actions: ->
    @listenTo Backbone, "assets:index", @index

  index: ->
    ds.collectionHelper.bootstrap ds.collections.assets
    @activate()
    @views.index = new ds.AssetsIndexView
    @views.index.renderTo @targetEl
