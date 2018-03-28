require 'date'

class Task < ApplicationRecord
  belongs_to :project
  belongs_to :status
  has_many :activity_tasks
  PLAY = 2
  PAUSE = 3

  def started?
    return true if status_id == PLAY
  end

  def play_pause!
    if status_id == PAUSE
      new_status = PLAY
    else
      new_status = PAUSE
    end
    update_attribute(:status_id, new_status)
  end

  def get_prev_play(activity)
    activity = ActivityTask.where('task_id = ? AND id < ?', activity.task.id, activity.id).played.last
    return activity
  end

  def total_minutes
    activities = ActivityTask.where('task_id', id).order('created_at asc')
    mins = 0.0
    play_at = ''

    activities.each do |activity| 
      
      if activity.status_id == PAUSE
        prev = get_prev_play(activity)
        time_diff   = activity.created_at - prev.created_at
        range       = (time_diff / 1.minute).round
        mins        = mins + range
      end       
      
    end

    return mins
  
  end
      ## | play        pause    play        pause  
      ## 10:30        12:00     14:00       15:00
      ##
end
