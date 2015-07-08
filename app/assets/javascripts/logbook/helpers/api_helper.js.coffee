ds.apiHelper =
  urls:
    engagements: -> "/api/v1/engagements"
    engagement: (id) -> "/api/v1/engagements/#{id}"
    engagement_attendees: (id) -> "/api/v1/engagements/#{id}/attendees"
    assets: -> "/api/v1/assets"
    asset: (id) -> "/api/v1/assets/#{id}"
    people:  -> "/api/v1/people"
    person: (id) -> "/api/v1/people/#{id}"
    projects:  -> "/api/v1/projects"
    project: (id) -> "/api/v1/projects/#{id}"
    schools: -> "/api/v1/schools"
    school: (id) -> "/api/v1/schools/#{id}"
    sites: -> "/api/v1/sites"
    site: (id) -> "/api/v1/sites/#{id}"

  urlFor: (path, args) ->
    @urls[path]? args
