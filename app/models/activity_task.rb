class ActivityTask < ApplicationRecord
  belongs_to :task
  belongs_to :status
end
