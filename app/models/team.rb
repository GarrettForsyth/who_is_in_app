class Team < ApplicationRecord
  mount_uploader :schedule, ScheduleUploader

  alias_attribute :members, :users
  alias_attribute :minimum_members_needed_for_an_event, :min_members

  has_and_belongs_to_many :users

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

  def member?(user)
    members.include?(user)
  end

  def captain?(user)
    captain == user
  end
end
