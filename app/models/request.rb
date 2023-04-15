class Request < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :media_type, presence: true
  validates :notes, length: { maximum: 500 }, allow_blank: true

  enum media_type: { tv: 0, movie: 1 }
  enum status: { pending: 0, filled: 1 }
end
