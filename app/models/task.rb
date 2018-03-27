class Task < ApplicationRecord
  belongs_to :project
  belongs_to :status
  has_many :activity_tasks

  def start
  	AcitivyTask.create(task_id: id, status_id: 3)
  end

  def pause
  	AcitivyTask.create(task_id: id, status_id: 2)
  end

end
