json.extract! @project, :id, :name, :description, :leader_ids, :supporter_ids, :updated_at, :created_at, :status
json.leaders @project.leaders.order(:first_name), :id, :first_name, :last_name, :name
json.supporters @project.supporters.order(:first_name), :id, :first_name, :last_name, :name
json.assets @project.assets, :thumbnail, :id, :data, :external_url, :caption
 
