module ApplicationHelper
  def pretty_email(email)
    email.split('@').first
  end
end
