window.ds ||= {}
ds.collectionHelper =
  bootstrap: (collection) ->
    collection.fetch({ reset: true })
_.extend ds.collectionHelper, Backbone.Events

