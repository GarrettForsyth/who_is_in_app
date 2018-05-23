class Message < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :team

  has_many :comments, dependent: :destroy

  validates :content, presence: true
end
