json.extract! task, :id, :status_id, :project_id, :category_id, :open_user_id, :user_id, :title, :description, :start_at, :conclusion_at, :finish_at, :effort_min, :worked_min, :priority, :created_at, :updated_at
json.url task_url(task, format: :json)
