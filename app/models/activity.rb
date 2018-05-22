class Activity < ApplicationRecord

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
