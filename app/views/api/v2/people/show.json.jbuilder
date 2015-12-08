json.extract! @person, :id,
  :created_at,
  :updated_at,
  :first_name,
  :last_name,
  :school_id,
  :school_name,
  :grade,
  :dream_team,
  :future_fellow,
  :role,
  :phone,
  :email,
  :description,
  :avatar,
  :ob_media_release,
  :ob_parental_consent,
  :ob_disclaimer,
  :birthday,
  :facebook_handle,
  :twitter_handle,
  :instagram_handle,
  :parent_first_name,
  :parent_last_name,
  :parent_phone,
  :parent_email
json.projects @person.project_people.includes(:project).order('projects.name') do |pp|
  json.id pp.project.id
  json.name pp.project.name
  json.description pp.project.description
  json.project_people_count pp.project.project_people.count
  json.leading pp.leading
end
json.engagements @person.engagements.order('date DESC').limit(20)
json.partial! 'api/v2/notes/notes', notes: @person.notes
