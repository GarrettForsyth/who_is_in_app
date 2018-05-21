class User < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :captained_teams, class_name: 'Team', dependent: :destroy
  has_many :messages, foreign_key: 'author_id', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  before_save :downcase_email

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }

  private
  def downcase_email
    email.downcase!
  end
end
