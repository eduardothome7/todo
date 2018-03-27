json.extract! project, :id, :client_id, :name, :description, :status_project, :created_at, :updated_at
json.url project_url(project, format: :json)
