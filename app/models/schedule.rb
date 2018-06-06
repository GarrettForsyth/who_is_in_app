class Schedule < ApplicationRecord
  mount_uploader :image, ScheduleUploader
  belongs_to :team
  has_many :events

  def upcoming_events
    now = DateTime.now.utc
    events
      .select { |e| now < e.start.utc }
      .sort_by { |e| e.start }
  end

  def finished_events
    now = DateTime.now.utc
    events
      .select { |e| now > e.start.utc }
  end
end
