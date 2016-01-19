Backbone.Collection.prototype.bootstrap = ->
  # reset the colection from localStorage
  @fetch
    remote: false
    reset: true
    success: =>
      @syncDirtyAndDestroyed()
      # get the newest record
      sorted = @sortBy('id')
      newest = _.last(sorted)?.get('created_at')
      if newest
        # store the range of dates we're looking for
        params =
          sync_time: Date.parse(newest).toJSON()
        # ajax to remote url, getting all records newer than newest
        $.ajax
          url: "#{@url()}/sync"
          data: params
          complete: (response) =>
            # if there are new records, re-sync the whole set
            if response.status == 302
              localStorage.removeItem(@url())
              @trigger "sync:started"
              @fetch
                remote: true,
                reset: true
                complete: => @trigger("sync:ended")

      else # if there is no newest record, reset from remote source
        @trigger "sync:started"
        @fetch
          reset: true
          remote: true
          complete: => @trigger("sync:ended")
