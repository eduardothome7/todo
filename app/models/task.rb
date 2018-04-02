require 'date'

class Task < ApplicationRecord
  belongs_to :project
  belongs_to :status
  belongs_to :category
  has_many :activity_tasks
  STARTED   = 1
  PLAY      = 2
  PAUSE     = 3
  FINISHED  = 4
  scope :started, -> { where(status_id: STARTED ) }
  scope :played, -> { where(status_id: PLAY ) }
  scope :paused, -> { where(status_id: PAUSE) }
  scope :finished, -> { where(status_id: FINISHED) }

  def started?
    return true if status_id == PLAY
  end

  def pause?
    return true if status_id == PAUSE
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
    activity = activity_tasks.where('id < ?', activity.id).played.last
    return activity
  end

  def start_at 
    if activity_tasks.any?
      return activity_tasks.played.first.created_at
    end
  end

  def total_minutes
    activities = activity_tasks.order('created_at asc')
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
