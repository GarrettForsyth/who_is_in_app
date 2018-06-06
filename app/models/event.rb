class Event < ApplicationRecord
  belongs_to :schedule

  validates :start, presence: true
end
