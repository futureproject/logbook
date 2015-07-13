json.cache! ['schools/v1', current_scope.id, @schools.maximum(:updated_at), @t.first, @t.last] do
  json.array!(@schools) do |school|
    json.extract! school, :id,
      :name, :enrollment
    json.engaged_people_count school.people.joins(:engagements).merge(Engagement.btw(@t)).uniq.count
    json.engagements_count school.engagements.btw(@t).count
    json.person_hours Engagement.person_hours(scope: school.engagements, times: @t)
    json.projects_count school.projects.btw(@t).count
    json.people_with_projects_count school.people.joins(:projects).merge(Project.btw(@t)).uniq.count
  end
end
