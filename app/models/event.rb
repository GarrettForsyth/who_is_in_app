class Event < ApplicationRecord
  alias_attribute :attending, :users
  has_and_belongs_to_many :users
  belongs_to :schedule

  validates :start, presence: true

  def absent
    schedule.team.members.reject do |member|
      attending.include?(member)
    end
  end
end
