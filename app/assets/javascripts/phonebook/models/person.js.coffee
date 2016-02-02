class ds.Person extends Backbone.Model
  namespace: 'people'
  urlRoot: ds.apiHelper.urlFor 'people'
  defaults: ->
    role: 'student'
    grade: null
    school_id: ds.CURRENT_USER.get('school_id')

  toJSON: ->
    _.omit _.clone(@attributes), ['engagements', 'projects', 'notes']

  tplAttrs: -> { person: @toJSON() }

  validate: (attrs, options) ->
    if !attrs.first_name
      "This person needs a first name."
    else if !attrs.last_name
      "This person needs a last name."

class ds.PeopleCollection extends Backbone.Collection
  model: ds.Person
  namespace: 'people'
  url: -> ds.apiHelper.urlFor @namespace
  search: (query) ->
    return unless query.length > 1
    q = query.toLowerCase()
    # find local results and return them
    results = @clone().filter (person) ->
      first = person.get('first_name')
      last = person.get('last_name')
      searchString = (first + " " + last).toLowerCase().trim()
      searchString.match(q)
    results_collection = new Backbone.Collection(results)
    Backbone.trigger "people:search:results", query, results_collection
    @trigger "search:results", query, results_collection
    # now search for remote results and return those too
    $.ajax
      url: "#{@url()}/search"
      data: {q: q}
      complete: (response) =>
        server_results = response.responseJSON
        if server_results.length > 0
          results_collection.add server_results
          Backbone.trigger "people:search:results", query, results_collection
          @trigger "search:results", query, results_collection

  bootstrap: ->
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
        timestamp = newest.get('last_engaged') || new Date().toString()
        params =
          sync_time: Date.parse(timestamp).toString()
        #check for records engaged after 'newest'
        console.log "checking for new records..."
        $.ajax
          url: "#{@url()}/sync"
          data: params
          complete: (response) =>
            # if there are new records, re-sync the whole set
            if response.status == 302
              console.log "... found."
              @resetFromServer()
            else
              @trigger("sync:ended")
              console.log "... none."

      else # if there is no newest record, reset from remote source
        @resetFromServer()
