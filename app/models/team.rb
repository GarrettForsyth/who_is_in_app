class Team < ApplicationRecord
  has_and_belongs_to_many :users
  alias_attribute :members, :users

  belongs_to :activity
end
