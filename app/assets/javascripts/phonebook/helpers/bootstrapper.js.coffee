ds.bootstrapper =

  bootstrap: (collection) ->
    if navigator.onLine then @loadRemote(collection) else @loadLocal(collection)

  loadLocal: (collection) ->
    collection.fetch
      reset: true
      remote: false
      success: ->
        $('.loading').remove()

  loadRemote: (collection) ->
    collection.syncDirtyAndDestroyed()
    collection.fetch
      reset: true
      remote: true
      success: ->
        console.log "#{collection.constructor.name} synced from server"
        $('.loading').remove()
