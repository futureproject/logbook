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
