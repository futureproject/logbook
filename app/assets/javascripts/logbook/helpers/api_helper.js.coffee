ds.apiHelper =
  urls:
    assets: -> "/api/v1/assets"
    asset: (id) -> "/api/v1/assets/#{id}"
    engagements: -> "/api/v1/engagements"
    engagement: (id) -> "/api/v1/engagements/#{id}"
    engagement_attendees: (id) -> "/api/v1/engagements/#{id}/attendees"
    people:  -> "/api/v1/people"
    person: (id) -> "/api/v1/people/#{id}"
    projects:  -> "/api/v1/projects"
    project: (id) -> "/api/v1/projects/#{id}"
    national_graphs: (graph) -> "/api/v1/nationals/0/#{graph}"
    schools: -> "/api/v1/schools"
    school: (id) -> "/api/v1/schools/#{id}"
    school_graphs: (args) -> "/api/v1/schools/#{args.id}/#{args.graph}"
    sites: -> "/api/v1/sites"
    site_graphs: (args) -> "/api/v1/sites/#{args.id}/#{args.graph}"
    site: (id) -> "/api/v1/sites/#{id}"

  urlFor: (path, args) ->
    @urls[path]? args
