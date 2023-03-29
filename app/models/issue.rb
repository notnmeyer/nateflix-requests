class Issue < ApplicationRecord
  validates :title, presence: true
  validates :notes, presence: true

  enum status: { reported: 0, resolved: 1, wontfix: 2 }
end