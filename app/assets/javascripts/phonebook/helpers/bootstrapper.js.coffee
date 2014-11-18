ds.bootstrapper =
  load: (collection) ->
    collection.fetch
      reset: true
      remote: false
      success: ->
        collection.fetch
          reset: collection.length <= 1
          remote: true
          success: ->
            console.log 'synced from server'

