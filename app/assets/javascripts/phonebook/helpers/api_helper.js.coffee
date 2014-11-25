ds.apiHelper =
  urls:
    engagements: -> "/api/v1/engagements"
    engagement: (id) -> "/api/v1/engagements/#{id}"
    assets: -> "/api/v1/assets"
    asset: (id) -> "/api/v1/assets/#{id}"
    people:  -> "/api/v1/people"
    person: (id) -> "/api/v1/people/#{id}"
    schools: -> "/api/v1/schools"

  urlFor: (path, args) ->
    @urls[path]? args
