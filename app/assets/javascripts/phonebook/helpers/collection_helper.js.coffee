window.ds ||= {}
ds.collectionHelper =
  bootstrap: (collection) ->
    if collection.length > 1
      Backbone.trigger "#{collection.namespace}:bootstrapped", collection
    else
      collection.fetch
        reset: true
        sucess: -> Backbone.trigger "#{collection.namespace}:bootstrapped", collection
        error: -> console.log 'wtf'

_.extend ds.collectionHelper, Backbone.Events

