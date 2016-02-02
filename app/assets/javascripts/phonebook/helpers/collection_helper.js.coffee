Backbone.Collection.prototype.resetFromLocalStorage = (callback) ->
  @fetch
    remote: false
    reset: true
    success: callback

Backbone.Collection.prototype.bootstrap = ->
  # sync dirty models
  @syncDirtyAndDestroyed()
  # reset the colection from localStorage
  @resetFromLocalStorage =>
    @trigger "sync:started"
    # sync dirty models AGAIN, in case there were no models before local reset
    @syncDirtyAndDestroyed()
    # reset from server
    @resetFromServer()

Backbone.Collection.prototype.resetFromServer = ->
  console.log "resetting collection from server..."
  localStorage.removeItem(@url())
  @fetch
    remote: true,
    reset: true
    success: =>
    complete: =>
      console.log "... done."
      @trigger("sync:ended")

Backbone.Collection.prototype.getMultiple = (ids) ->
    results = _.map (ids), (id) =>
      @get(id)
    results
