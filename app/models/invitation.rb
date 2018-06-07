class Invitation < ApplicationRecord
  belongs_to :from, class_name: 'User'
  belongs_to :to, class_name: 'User'
  belongs_to :team

  validate :not_teammate
  validate :not_already_sent
  validate :sender_is_captain

  def invite_email
    to.email if to
  end

  def invite_email=(email)
    self.to = User.find_by(email: email)
  end

  def accept
    team.add_member(to)
    team.schedule.events.each do |event|
      event.attending << to
    end
  end

  private

  def sender_is_captain
    errors.add(:from, 'must be team captain') unless from && team && team.captain?(from)
  end

  def not_teammate
    errors.add(:to, 'is already a team member') if to && team && team.member?(to)
  end

  def not_already_sent
    if Invitation.find_by(to: to, from: from, team: team)
      errors.add(:to, 'has already received this invitation')
    end
  end
end
