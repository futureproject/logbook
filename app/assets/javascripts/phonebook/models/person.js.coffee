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
