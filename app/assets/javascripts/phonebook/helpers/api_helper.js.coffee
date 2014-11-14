ds.apiHelper =
  urls:
    engagements: -> "/api/v1/engagements"
    people: (site_id) -> "/api/v1/sites/#{site_id}/people"

  urlFor: (path, args) ->
    @urls[path]? args
