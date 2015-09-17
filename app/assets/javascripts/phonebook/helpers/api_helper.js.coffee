ds.apiHelper =
  urls:
    engagements: -> "/api/public/engagements"
    engagement: (id) -> "/api/public/engagements/#{id}"
    people:  -> "/api/public/people"
    person: (id) -> "/api/public/people/#{id}"
    #projects:  -> "/api/public/projects"
    #project: (id) -> "/api/public/projects/#{id}"
    schools: -> "/api/public/schools"
    sessions: -> "/api/public/sessions/new"
    sites: -> "/api/public/sites"

  urlFor: (path, args) ->
    @urls[path]? args
