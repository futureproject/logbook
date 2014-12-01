ds.bootstrapper =
  loadLocal: (collection) ->
    collection.fetch
      reset: true
      remote: false

  loadRemote: (collection) ->
    collection.syncDirtyAndDestroyed()
    collection.fetch
      reset: true
      remote: true
      success: ->
        console.log "#{collection.constructor.name} synced from server"
