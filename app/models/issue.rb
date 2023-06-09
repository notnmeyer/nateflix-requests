class Issue < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :notes, length: { maximum: 500 }, allow_blank: true

  enum status: { reported: 0, resolved: 1, wontfix: 2 }
end
