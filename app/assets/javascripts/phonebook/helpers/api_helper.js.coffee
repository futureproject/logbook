ds.apiHelper =
  urls:
    assets: -> "/api/v2/assets"
    asset: (id) -> "/api/v2/assets/#{id}"
    assets_s3_path: -> "/api/v3/assets/signed_s3_path"
    engagements: -> "/api/v3/engagements"
    engagement: (id) -> "/api/v3/engagements/#{id}"
    me: -> "/api/v3/me"
    people:  -> "/api/v3/people"
    person: (id) -> "/api/v3/people/#{id}"
    #projects:  -> "/api/v3/projects"
    #project: (id) -> "/api/v3/projects/#{id}"
    registrations: -> "/identities/register"
    schools: -> "/api/v3/schools"
    sessions: -> "/sessions/new"
    sites: -> "/api/v3/sites"

  urlFor: (path, args) ->
    @urls[path]? args
