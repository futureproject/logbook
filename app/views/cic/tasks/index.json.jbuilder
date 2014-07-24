json.array!(@tasks) do |task|
  json.extract! task, :id, :action, :user_id
  json.url task_url(task, format: :json)
end
