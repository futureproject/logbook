ds.bootstrapper =

  bootstrap: (collection) ->
    collection.fetch
      reset: true
      remote: false
      success: ->
        if navigator.onLine
          collection.syncDirtyAndDestroyed()
          collection.fetch
            reset: true
            remote: true

  loadLocal: (collection) ->
    collection.fetch
      reset: true
      remote: false

  #loadRemote: (collection) ->
    #console.log collection
    #collection.syncDirtyAndDestroyed()
    #collection.fetch
      #reset: true
      #remote: true
      #success: ->
        #Backbone.trigger 'collection:bootstrapped', collection
        #$('.loading').remove()
