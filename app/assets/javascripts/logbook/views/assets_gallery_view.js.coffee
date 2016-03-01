class ds.AssetsGalleryView extends Backbone.View
  initialize: (args={})->
    @collection = args.collection
    @listenTo @collection, 'add', @addAsset
    @listenTo @collection, 'reset', @render

  render: ->
    fragment = document.createDocumentFragment()
    @renderAsset(asset, fragment) for asset in @collection.models
    @$el.html(fragment)

  renderAsset: (asset, fragment=document.createDocumentFragment())->
    view = new ds.AssetPhotoView
      model: asset
    fragment.appendChild(view.render().el)
    fragment

  addAsset: (asset) ->
    elem = @renderAsset(asset)
    @$el.append elem

