ds.apiHelper =
  urls:
    assets: -> "/api/v2/assets"
    asset: (id) -> "/api/v2/assets/#{id}"
    assets_s3_path: -> "/api/v2/assets/signed_s3_path"
    engagements: -> "/api/insecure/engagements"
    engagement: (id) -> "/api/insecure/engagements/#{id}"
    people:  -> "/api/insecure/people"
    person: (id) -> "/api/insecure/people/#{id}"
    projects:  -> "/api/insecure/projects"
    project: (id) -> "/api/insecure/projects/#{id}"

  urlFor: (path, args) ->
    @urls[path]? args
