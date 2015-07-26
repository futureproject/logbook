ds.apiHelper =
  urls:
    assets: -> "/api/v2/assets"
    asset: (id) -> "/api/v2/assets/#{id}"
    engagements: -> "/api/v2/engagements"
    engagements_leaderboard:  -> "/api/v2/engagements/leaderboard"
    engagement: (id) -> "/api/v2/engagements/#{id}"
    engagement_attendees: (id) -> "/api/v2/engagements/#{id}/attendees"
    people:  -> "/api/v2/people"
    people_leaderboard:  -> "/api/v2/people/leaderboard"
    person: (id) -> "/api/v2/people/#{id}"
    projects:  -> "/api/v2/projects"
    projects_leaderboard:  -> "/api/v2/projects/leaderboard"
    project: (id) -> "/api/v2/projects/#{id}"
    schools: -> "/api/v2/schools"
    school: (id) -> "/api/v2/schools/#{id}"
    sites: -> "/api/v2/sites"
    site: (id) -> "/api/v2/sites/#{id}"
    national_graphs: (graph) -> "/api/v2/nationals/usa/graphs/#{graph}"
    site_graphs: (args) -> "/api/v2/sites/#{args.id}/graphs/#{args.graph}"
    school_graphs: (args) -> "/api/v2/schools/#{args.id}/graphs/#{args.graph}"
    people_graphs: (args) -> "/api/v2/people/#{args.id}/graphs/#{args.graph}"

  urlFor: (path, args) ->
    @urls[path]? args
