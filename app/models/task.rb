require 'date'

class Task < ApplicationRecord
  belongs_to :project
  belongs_to :status
  has_many :activity_tasks

  def started?
  	return true if status_id == 2
  end

  def total_minutes
  	activities = ActivityTask.where('task_id', id).order('created_at asc')
  	mins = 0.0
  	i = 0
  	activities.each do |activity|
  	  if i == 2
  		i = 0
  		time_diff 	= time1 + time2
  		range 		= (time_diff / 1.minute).round
  		mins 		= mins + range
  		next 
  	  end
  		
  	  if activity.status_id == 2
  		time1 = activity.created_at
  	  else
  		time2 = activity.created_at
  	  end
  		
   	  i++ 
  	end
  	return mins
  end

end
