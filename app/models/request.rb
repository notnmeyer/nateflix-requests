class Request < ApplicationRecord
  include SnsNotification

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :media_type, presence: true
  validates :notes, length: { maximum: 500 }, allow_blank: true

  enum media_type: { tv: 0, movie: 1 }
  enum status: { pending: 0, filled: 1, wontfill: 2 }

  private

  def generate_notification_message
    "New Request from #{user.email}: #{title} (#{media_type})"
  end
end
