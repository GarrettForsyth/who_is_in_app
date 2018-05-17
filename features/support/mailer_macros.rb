# Helper functions for ActionMailer
module MailerMacros
  def last_email
    ActionMailer::Base.deliveries.last
  end

  def num_emails
    ActionMailer::Base.deliveries.size
  end

  def reset_emails
    ActionMailer::Base.deliveries = []
  end
end

World(MailerMacros)
