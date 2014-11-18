ds.apiHelper =
  urls:
    engagements: -> "/api/v1/engagements"
    engagement: (id) -> "/api/v1/engagements/#{id}"
    people:  -> "/api/v1/people"
    person: (id) -> "/api/v1/people/#{id}"
    schools: -> "/api/v1/schools"

  urlFor: (path, args) ->
    @urls[path]? args
