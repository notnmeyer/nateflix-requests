class Comment < ApplicationRecord
  belongs_to :request
  belongs_to :author, class_name: 'User'
  validates :content, presence: true, length: { minimum: 1 }
end
