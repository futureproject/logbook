json.(@identity, :id, :token, :first_name, :last_name)
json.person do
  json.(@identity.person, :id, :first_name, :last_name,
    :school_id, :site_id, :registered, :role) if @identity.person
  # something so that person hash renders even when there's no person
  json.current_identity @identity.id
end
