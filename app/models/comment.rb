class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: 'User'
  validates :content, presence: true, length: { minimum: 1 }
end
