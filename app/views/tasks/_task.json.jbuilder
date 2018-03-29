json.extract! task
json.id task.id
json.title task.title
json.project_id task.project_id
json.project task.project.name
json.client task.project.client.name
json.project_id task.project_id
json.start_at task.start_at
json.url task_url(task, format: :json)

