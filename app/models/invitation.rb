class Invitation < ApplicationRecord
  belongs_to :from, class_name: 'User'
  belongs_to :to, class_name: 'User'
  belongs_to :team

  def invite_email
    User.find(to).email if to
  end

  def invite_email=(email)
    self.to = User.find_by(email: email)
  end

  def accept
    team.members << to
  end
end
