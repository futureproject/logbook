ds.bootstrapper =

  bootstrap: (collection) ->
    collection.fetch
      reset: true
      remote: false
      success: ->
        Backbone.trigger "#{collection.namespace}:bootstrapped", collection
        if navigator.onLine
          collection.syncDirtyAndDestroyed()
          collection.fetch
            reset: true
            remote: true
            success: ->
              Backbone.trigger "#{collection.namespace}:bootstrapped", collection

  #loadLocal: (collection) ->
    #collection.fetch
      #reset: true
      #remote: false
      #success: ->
        #Backbone.trigger "#{collection.namespace}:bootstrapped", collection

  #loadRemote: (collection) ->
    #console.log collection
    #collection.syncDirtyAndDestroyed()
    #collection.fetch
      #reset: true
      #remote: true
      #success: ->
        #Backbone.trigger 'collection:bootstrapped', collection
        #$('.loading').remove()
