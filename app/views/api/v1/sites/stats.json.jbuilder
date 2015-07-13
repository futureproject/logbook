json.cache! ['sites/v1', @sites.maximum(:updated_at), @t.first, @t.last] do
  json.array!(@sites) do |site|
    json.id site.id
    json.name site.name
    json.enrollment site.enrollment
    json.engaged_people_count site.people.joins(:engagements).merge(Engagement.btw(@t)).uniq.count
    json.engagements_count site.engagements.btw(@t).count
    json.person_hours Engagement.person_hours(scope: site.engagements, times: @t)
    json.projects_count site.projects.btw(@t).count
    json.people_with_projects_count site.people.joins(:projects).merge(Project.btw(@t)).uniq.count
  end
end
