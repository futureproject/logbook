ds.apiHelper =
  urls:
    engagements: -> "/api/v1/engagements"
    engagement: (id) -> "/api/v1/engagements/#{id}"
    people: (site_id) -> "/api/v1/people"
    person: (id) -> "/api/v1/people/#{id}"

  urlFor: (path, args) ->
    @urls[path]? args
