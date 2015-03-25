json.extract! @person, :id,
  :created_at,
  :updated_at,
  :first_name,
  :last_name,
  :school_id,
  :school_name,
  :grade,
  :role,
  :notes,
  :phone,
  :email
json.projects @person.projects, :name, :id
json.engagements @person.engagements.order('date DESC')
