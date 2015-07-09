window.ds ||= {}
ds.collectionHelper =
  bootstrap: (collection) ->
    if collection.length == 0
      collection.fetch
        reset: true
        sucess: -> Backbone.trigger "#{collection.namespace}:bootstrapped", collection
        error: -> console.log 'wtf'
    else
      Backbone.trigger "#{collection.namespace}:bootstrapped", collection

_.extend ds.collectionHelper, Backbone.Events

