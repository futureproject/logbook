Backbone.Collection.prototype.bootstrap = ->
  # reset the colection from localStorage
  @fetch
    remote: false
    reset: true
    success: =>
      @syncDirtyAndDestroyed()
      # get the newest record
      c = @fullCollection || @
      sorted = c.sortBy('id')
      newest = _.last(sorted)?.get('created_at')
      now = new Date()
      if newest
        # store the range of dates we're looking for
        params =
          t_start: Date.parse(newest).toJSON()
          t_end: now.toJSON()
        # ajax to remote url, getting all records newer than newest
        $.ajax
          url: @url()
          data: params
          success: (response) =>
            # if there are new records, re-sync the whole set
            console.log response
            if response.length > 0
              console.log "syncing new records..."
              @fetch({ remote: true, reset: true, success: -> console.log "... done" })

      else # if there is no newest record, reset from remote source
        @fetch
          reset: true
          remote: true
