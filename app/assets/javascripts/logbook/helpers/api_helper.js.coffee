ds.apiHelper =
  urls:
    assets: -> "/api/v2/assets"
    asset: (id) -> "/api/v2/assets/#{id}"
    assets_s3_path: -> "/api/v2/assets/signed_s3_path"
    engagements: -> "/api/v2/engagements"
    engagements_leaderboard:  -> "/api/v2/engagements/leaderboard"
    engagement: (id) -> "/api/v2/engagements/#{id}"
    engagement_attendees: (id) -> "/api/v2/engagements/#{id}/attendees"
    national_graphs: (graph) -> "/api/v2/nationals/usa/graphs/#{graph}"
    notes: -> "/api/v2/notes"
    people:  -> "/api/v2/people"
    people_leaderboard:  -> "/api/v2/people/leaderboard"
    people_graphs: (args) -> "/api/v2/people/#{args.id}/graphs/#{args.graph}"
    person: (id) -> "/api/v2/people/#{id}"
    projects:  -> "/api/v2/projects"
    projects_leaderboard:  -> "/api/v2/projects/leaderboard"
    project: (id) -> "/api/v2/projects/#{id}"
    report_submissions: -> "/api/v2/report_submissions"
    schools: -> "/api/v2/schools"
    school: (id) -> "/api/v2/schools/#{id}"
    school_graphs: (args) -> "/api/v2/schools/#{args.id}/graphs/#{args.graph}"
    search_results: -> "/api/v2/search_results"
    sites: -> "/api/v2/sites"
    site: (id) -> "/api/v2/sites/#{id}"
    site_graphs: (args) -> "/api/v2/sites/#{args.id}/graphs/#{args.graph}"

  urlFor: (path, args) ->
    @urls[path]? args
