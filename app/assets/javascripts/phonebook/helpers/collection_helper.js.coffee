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
    # get the newest record
    newest = @first()
    if newest
      # store the range of dates we're looking for
      timestamp = @timestamp_attr || "created_at"
      params =
        sync_time: Date.parse(newest.get(timestamp)).toString()
      #check for records engaged after 'newest'
      console.log "checking for new records..."
      $.ajax
        url: "#{@url()}/sync"
        data: params
        complete: (response) =>
          # if there are new records, re-sync the whole set
          if response.status == 302
            console.log "... found."
            localStorage.removeItem(@url())
            @resetFromServer()
          else
            @trigger("sync:ended")
            console.log "... none."

    else # if there is no newest record, reset from remote source
      @resetFromServer()

Backbone.Collection.prototype.resetFromServer = ->
  console.log "resetting collection from server..."
  @fetch
    remote: true,
    reset: true
    complete: =>
      console.log "... done."
      @trigger("sync:ended")

Backbone.Collection.prototype.getMultiple = (ids) ->
    results = _.map (ids), (id) =>
      @get(id)
    results
