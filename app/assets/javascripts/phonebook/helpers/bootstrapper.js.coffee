ds.bootstrapper =

  bootstrap: (collection) ->
    collection.fetch
      reset: true
      remote: false
      success: ->
        $('.loading').remove()
        if navigator.onLine
          collection.syncDirtyAndDestroyed()
          collection.fetch
            reset: true
            remote: true
            success: ->
              console.log "#{collection.constructor.name} synced from server"

  loadLocal: (collection) ->
    collection.fetch
      reset: true
      remote: false
      success: ->
        console.log "#{collection.constructor.name} synced from localStorage"
        $('.loading').remove()

  loadRemote: (collection) ->
    console.log collection
    collection.syncDirtyAndDestroyed()
    collection.fetch
      reset: true
      remote: true
      success: ->
        console.log "#{collection.constructor.name} synced from server"
        $('.loading').remove()
