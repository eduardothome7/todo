class ActivityTask < ApplicationRecord
  belongs_to :task
  belongs_to :status
  PLAY = 2
  PAUSE = 3
  scope :played, -> { where(status_id: PLAY ) }
  scope :paused, -> { where(status_id: PAUSE) }

end
