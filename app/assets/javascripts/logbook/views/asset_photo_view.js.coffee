class ds.AssetPhotoView extends Backbone.View
  initialize: ->

  className: ->
   "polaroid"

  template: JST["logbook/templates/asset_photo"]

  render: ->
    @$el.html @template(@model.tplAttrs())
    @

  events:
    'click .delete': 'delete'

