Backbone.Collection.prototype.resetFromLocalStorage = (callback) ->
  @fetch
    remote: false
    reset: true
    success: callback

Backbone.Collection.prototype.bootstrap = ->
  # reset the colection from localStorage
  @resetFromLocalStorage =>
    #@syncDirtyAndDestroyed()
    # get the newest record
    sorted = @sortBy('id')
    newest = _.last(sorted)?.get('created_at')
    if newest
      # store the range of dates we're looking for
      params =
        sync_time: Date.parse(newest).toString()
      #check for records created after 'newest'
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
            console.log "... none."

    else # if there is no newest record, reset from remote source
      @resetFromServer()

Backbone.Collection.prototype.resetFromServer = ->
  console.log "resetting collection from server..."
  @trigger "sync:started"
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
