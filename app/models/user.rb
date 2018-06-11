class User < ApplicationRecord
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :events

  has_many :captained_teams, class_name: 'Team', dependent: :destroy
  has_many :messages, foreign_key: 'author_id', dependent: :destroy
  has_many :invitations, foreign_key: 'to_id', dependent: :destroy
  has_many :finances, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :omniauthable,
         omniauth_providers: %i[google_oauth2]

  before_save :downcase_email

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }

  def finance_for(team)
    Finance.find_by(user: self, team: team)
  end

  def self.from_google_oauth2(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]

      # oauth stuff
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.scope = 'profile '

      user.skip_confirmation!
    end
  end

  private
  def downcase_email
    email.downcase!
  end
end
