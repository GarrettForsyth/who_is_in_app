class Team < ApplicationRecord
  mount_uploader :schedule, ScheduleUploader

  has_and_belongs_to_many :users
  alias_attribute :members, :users

  belongs_to :captain, class_name: 'User', foreign_key: 'user_id'
  belongs_to :activity

  has_many :messages

  validates :name, presence: true
  validates :activity_id, presence: true
  validates :min_members, presence: true
  validates :min_members, numericality: { greater_than: 0 }

  def add_member(user)
    members << user
  end
end
