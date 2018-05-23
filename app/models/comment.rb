class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :message

  validates :content, presence: true
end
