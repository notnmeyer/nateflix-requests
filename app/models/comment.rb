class Comment < ApplicationRecord
  belongs_to :request
  belongs_to :author, class_name: 'User'
end
