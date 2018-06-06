class Schedule < ApplicationRecord
  mount_uploader :image, ScheduleUploader
  belongs_to :team
end
