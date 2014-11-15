ds.apiHelper =
  urls:
    engagements: -> "/api/v1/engagements"
    people: (site_id) -> "/api/v1/people"

  urlFor: (path, args) ->
    @urls[path]? args
