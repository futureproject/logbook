json.array!(@my_projects) do |my_project|
  json.extract! my_project, :id
  json.url my_project_url(my_project, format: :json)
end
