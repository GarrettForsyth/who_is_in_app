class Team < ApplicationRecord
  has_and_belongs_to_many :users
  alias_attribute :members, :users

  belongs_to :activity

  validates :name, presence: true
  validates :activity_id, presence: true
  validates :min_members, presence: true
  validates :min_members, numericality: { greater_than: 0 }
end
