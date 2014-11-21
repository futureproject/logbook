ds.bootstrapper =
  load: (collection) ->
    collection.fetch
      reset: true
      remote: false
      success: ->
        collection.syncDirtyAndDestroyed()
        collection.fetch
          reset: true
          remote: true
          success: ->
            console.log "#{collection.constructor.name} synced from server"

