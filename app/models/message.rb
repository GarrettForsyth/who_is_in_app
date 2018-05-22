class Message < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :team

  validates :content, presence: true
end
