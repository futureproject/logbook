json.array!(@citybook_sites) do |citybook_site|
  json.extract! citybook_site, :id
  json.url citybook_site_url(citybook_site, format: :json)
end
