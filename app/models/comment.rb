class Comment < ApplicationRecord
  include SnsNotification

  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: 'User'
  validates :content, presence: true, length: { minimum: 1 }

  private

  def generate_notification_message
    "New comment on #{commentable.title} by #{author.email}: #{content}"
  end
end
