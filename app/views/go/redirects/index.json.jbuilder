json.array!(@go_redirects) do |go_redirect|
  json.extract! go_redirect, :id, :shortcut, :url, :hit_count
  json.url go_redirect_url(go_redirect, format: :json)
end
